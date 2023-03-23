import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:offsite_trial_establishment_app/common/constants/enviroment.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/common/utils/background_task_manager.dart';
import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart';
import 'package:offsite_trial_establishment_app/common/utils/stream_wrapper.dart';
import 'package:offsite_trial_establishment_app/data/services/sync/sync_ordered_collection.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planter_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planting_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/trial_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/message.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/sending_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/domain/services/connect_service.dart';
import 'package:offsite_trial_establishment_app/domain/services/foreground_sync_service.dart';
import 'package:offsite_trial_establishment_app/domain/services/message_service.dart';
import 'package:rxdart/rxdart.dart';

const _debounce = Duration(seconds: 1);
const _checkTaskPeriod = Duration(seconds: 5);

@LazySingleton(as: ForegroundSyncService, env: AppEnvironment.foreground)
class OrderedForegroundSyncService extends ForegroundSyncService {
  final PlanterInteractor _planterInteractor;
  final PlantingInteractor _plantingInteractor;
  final TrialInteractor _trialInteractor;
  final ConnectService _connectService;
  final MessageService _messageService;
  final ObjectBoxManager _objectBoxManager;

  late final Logger _logger = getIt();

  final _order = SyncOrderedCollection();
  final _streamWrapper = StreamWrapper<SendingStatus>(const SendingStatus.noLoading());

  var hasConnection = true;
  var isCancelled = false;
  var needSendMessageWhenCloseCommonDB = false;

  StreamSubscription? _subPlanter;
  StreamSubscription? _subPlanting;
  StreamSubscription? _subTrial;
  StreamSubscription? _subConnect;
  StreamSubscription? _subMessage;
  Completer? _completer;
  Completer? _settingCompleter;
  Timer? _checkTimer;

  OrderedForegroundSyncService(
    this._planterInteractor,
    this._plantingInteractor,
    this._trialInteractor,
    this._connectService,
    this._messageService,
    this._objectBoxManager,
  ) {
    _settingsService();
  }

  @override
  Stream<SendingStatus> getStatus() => _streamWrapper.stream;

  @override
  Future<void> reload() async {
    isCancelled = false;
    await _completer?.future;
    await _reload();
  }

  @override
  Future<void> retrySending() async {
    _streamWrapper.value = const SendingStatus.noLoading();
    if (await BackgroundTaskManager.hasBackgroundTasks()) {
      _sendMessage(const Message.retry());
    } else {
      await _reload();
    }
  }

  @override
  Future<void> cancel() async {
    isCancelled = true;
    await _settingCompleter?.future;
    await _completer?.future;
    if (isCancelled) {
      _cancelSubscription();
    }
  }

  void _cancelSubscription() {
    _checkTimer?.cancel();
    _checkTimer = null;
    _subPlanter?.cancel();
    _subPlanter = null;
    _subPlanting?.cancel();
    _subPlanting = null;
    _subTrial?.cancel();
    _subTrial = null;
    _subConnect?.cancel();
    _subConnect = null;
  }

  Future<void> _reload() async {
    if (_settingCompleter?.isCompleted == false) _settingCompleter?.complete();
    _settingCompleter = Completer();
    if (_objectBoxManager.isClosed()) _objectBoxManager.reopen();
    _order.clear();
    await _settingsService();
  }

  Future<void> _clearSyncing() async {
    await _planterInteractor.clearSyncing();
    await _trialInteractor.clearSyncing();
    await _plantingInteractor.clearSyncing();
  }

  Future<void> _settingsService() async {
    await _clearSyncing();
    _cancelSubscription();
    _subMessage ??= _messageService.getMessages().listen(_receiveMessage);
    _checkTimer = Timer.periodic(_checkTaskPeriod, (timer) => _checkTask());
    _subConnect = _connectService.hasConnectionStream().listen((hasConnect) {
      hasConnection = hasConnect;
      if (hasConnect) _runSyncIfNeed();
    });
    _subPlanter = _planterInteractor.getUnsynced().debounceTime(_debounce).listen(
          (planters) => _addSyncObjects(
            priority: planterPriority,
            objects: planters.map(_mapPlanter),
          ),
        );
    _subTrial = _trialInteractor.getUnsynced().debounceTime(_debounce).listen(
          (trials) => _addSyncObjects(
            priority: trialPriority,
            objects: trials.map(_mapTrial),
          ),
        );
    _subPlanting = _plantingInteractor.getUnsynced().debounceTime(_debounce).listen(
          (plantings) => _addSyncObjects(
            priority: plantingPriority,
            objects: plantings.map(_mapPlanting),
          ),
        );
    if (_settingCompleter?.isCompleted == false) _settingCompleter?.complete();
  }

  Future<void> _checkTask() async {
    if (await BackgroundTaskManager.hasBackgroundTasks()) return;
    if (_completer?.isCompleted == false) {
      _completer?.complete();
      _completer = null;
      _streamWrapper.value = _streamWrapper.value.maybeWhen(
        orElse: () => SendingStatus.noLoading(),
        error: (message) => SendingStatus.error(message: message),
      );
    }
  }

  void _receiveMessage(Message message) {
    message.when(
      status: (status) {
        _logger.i('Sync status changed: $status');
        _streamWrapper.value = status;
      },
      updated: _updated,
      endingWork: () {
        _logger.i('Background task is enging work');
        _completer?.complete();
        _completer = null;
      },
      confirmUpdated: (_, __, ___) {
        // ignore in foreground
      },
      retry: () {
        // ignore in foreground
      },
    );
  }

  Future<void> _sendMessage(Message message) async {
    await _messageService.sendMessage(message: message);
  }

  Future<void> _updated(
    List<Planter> planters,
    List<Trial> trials,
    List<Planting> plantings,
  ) async {
    await Future.wait(planters.map((e) => _planterInteractor.markAsSynced(e)));
    await _sendMessage(Message.confirmUpdated(planterIds: planters.mapList((e) => e.internalId)));
    await Future.wait(trials.map((e) => _trialInteractor.markAsSynced(e)));
    await _sendMessage(Message.confirmUpdated(trialIds: trials.mapList((e) => e.internalId)));
    await Future.wait(plantings.map((e) => _plantingInteractor.markAsSynced(e)));
    await _sendMessage(Message.confirmUpdated(plantingIds: plantings.mapList((e) => e.internalId)));
  }

  Future<void> _addSyncObjects({
    required int priority,
    required Iterable<SyncObject> objects,
  }) async {
    final oldLength = _order.length;
    _order.addAll(priority, objects);
    final newLength = _order.length;
    if (newLength != oldLength) {
      await _runSyncIfNeed();
    }
  }

  bool _hasError() {
    return _streamWrapper.value.maybeWhen(orElse: () => false, error: (_) => true);
  }

  Future<void> _runSyncIfNeed() async {
    if (_order.isEmpty) return;
    if ((!_hasError() || hasConnection) && _completer?.isCompleted != false) {
      _order.compress();
    }
    if (_completer?.isCompleted != false) {
      _completer = Completer();
    }
    final hasBackgroundTask = await BackgroundTaskManager.hasBackgroundTasks();
    if (isCancelled) {
      if (_completer?.isCompleted == false) _completer?.complete();
      return;
    }
    if (!hasBackgroundTask) {
      _logger.i('Background task is starting');
      await BackgroundTaskManager.initSyncTasks();
      await Future.delayed(_debounce);
    }
    await _syncProcess();
    await _completer?.future;
  }

  Future<void> _syncProcess() async {
    if (_order.isEmpty) return;
    var set = _order.getNext();
    while (set.isNotEmpty) {
      await Future.wait(set.map((object) async {
        object.state = SyncState.syncing;
        var state = SyncState.success;
        await object.process(object.id);
        object.state = state;
      }));
      set = _order.getNext();
    }
  }

  SyncObject _mapPlanter(Planter planter) => SyncObject(
        id: planter.internalId,
        process: _syncPlanter,
      );

  SyncObject _mapTrial(Trial trial) => SyncObject(
        id: trial.internalId,
        process: _syncTrial,
      );

  SyncObject _mapPlanting(Planting planting) => SyncObject(
        id: planting.internalId,
        process: _syncPlanting,
      );

  Future<void> _syncPlanter(int id) async {
    final planter = await _planterInteractor.getPlanterById(id).first;
    if (planter == null) return;
    await _messageService.sendMessage(message: Message.updated(planters: [planter]));
    await _planterInteractor.markAsSyncing(id);
  }

  Future<void> _syncTrial(int id) async {
    final trial = await _trialInteractor.getTrialById(id).first;
    if (trial == null) return;
    await _messageService.sendMessage(message: Message.updated(trials: [trial]));
    await _trialInteractor.markAsSyncing(id);
  }

  Future<void> _syncPlanting(int id) async {
    final planting = await _plantingInteractor.getPlantingById(id).first;
    if (planting == null) return;
    await _messageService.sendMessage(message: Message.updated(plantings: [planting]));
    await _plantingInteractor.markAsSyncing(id);
  }
}
