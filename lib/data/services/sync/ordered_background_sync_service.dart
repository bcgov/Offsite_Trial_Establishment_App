import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:offsite_trial_establishment_app/common/constants/duration.dart';
import 'package:offsite_trial_establishment_app/common/constants/enviroment.dart';
import 'package:offsite_trial_establishment_app/common/constants/instance_name.dart';
import 'package:offsite_trial_establishment_app/common/constants/strings.dart';
import 'package:offsite_trial_establishment_app/common/utils/error_utils.dart';
import 'package:offsite_trial_establishment_app/data/services/sync/sync_ordered_collection.dart';
import 'package:offsite_trial_establishment_app/di/di.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planter_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planting_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/trial_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/message.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/domain/models/sending_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/sync_status.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/domain/services/background_sync_service.dart';
import 'package:offsite_trial_establishment_app/domain/services/message_service.dart';
import 'package:offsite_trial_establishment_app/domain/services/notification_service.dart';
import 'package:rxdart/rxdart.dart';

const _debounce = Duration(seconds: 1);

@LazySingleton(as: BackgroundSyncService, env: AppEnvironment.background)
class OrderedBackgroundSyncService extends BackgroundSyncService {
  final PlanterInteractor _planterInteractor;
  final PlantingInteractor _plantingInteractor;
  final TrialInteractor _trialInteractor;
  final NotificationService _notificationService;
  final MessageService _messageService;
  final bool _isRefresh;

  late final Logger _logger = getIt();

  final _order = SyncOrderedCollection();

  var hasConnection = true;
  var needSendMessageWhenCloseCommonDB = false;

  StreamSubscription? _subPlanter;
  StreamSubscription? _subPlanting;
  StreamSubscription? _subTrial;
  StreamSubscription? _subMessage;
  final Completer _syncCompleter = Completer();
  Completer? _completer;
  Timer? _timer;
  List? errors;

  OrderedBackgroundSyncService(
    this._planterInteractor,
    this._plantingInteractor,
    this._trialInteractor,
    this._notificationService,
    this._messageService,
    @Named(InstanceNames.isRefresh) this._isRefresh,
  ) {
    _settingService();
  }

  @override
  Completer getCompleter() => _syncCompleter;

  @override
  Future<void> syncAll() async {
    await _clearSyncing();
    _order.clear();
    final planters = await _planterInteractor.getUnsynced().first;
    _order.addAll(planterPriority, planters.map(_mapPlanter));
    final trials = await _trialInteractor.getUnsynced().first;
    _order.addAll(trialPriority, trials.map(_mapTrial));
    final plantings = await _plantingInteractor.getUnsynced().first;
    _order.addAll(plantingPriority, plantings.map(_mapPlanting));
    await _runSyncIfNeed();
  }

  Future<void> _retrySending() async {
    errors = null;
    await _runSyncIfNeed();
  }

  Future<void> _cancel() async {
    await _completer?.future;
    _subPlanter?.cancel();
    _subPlanter = null;
    _subPlanting?.cancel();
    _subPlanting = null;
    _subTrial?.cancel();
    _subTrial = null;
    _subMessage?.cancel();
    _subMessage = null;
  }

  Future<void> _sendMessage(Message message) async {
    if (!_isRefresh) await _messageService.sendMessage(message: message);
  }

  Future<void> _runSyncIfNeed() async {
    if (_syncCompleter.isCompleted) return;
    if (_order.isNotEmpty &&
        (errors == null || hasConnection) &&
        (_completer == null || _completer?.isCompleted == true)) {
      errors = null;
      _timer?.cancel();
      _completer = Completer();
      _order.compress();
      _updateSendingStatus();
      await Future.delayed(AppDuration.syncStartDelay);
      _logger.i('Synchronization of ${_order.length} object(s) started');
      if (await _syncProcess()) {
        _logger.i('Synchronization of ${_order.length} object(s) completed successful');
        _order.clear();
      } else {
        _logger.i(
            'Synchronization of ${_order.length} object(s) failed(${errors?.map((e) => e.toString()).toSet().join("\n")}). Only ${_order.successCount} object(s) synced');
      }
      _timer = Timer(AppDuration.syncEndDelay, () => _updateSendingStatus(true));
      if (_completer?.isCompleted == false) _completer?.complete();
      _completer = null;
    } else {
      _updateSendingStatus();
      await _completer?.future;
    }
  }

  /// Returns `true` if all sync steps are success
  Future<bool> _syncProcess() async {
    var set = _order.getNext();
    while (set.isNotEmpty) {
      final errors = [];
      await Future.wait(set.map((object) async {
        object.state = SyncState.syncing;
        var state = SyncState.success;
        try {
          await object.process(object.id);
          _logger.i('Success sync for ${object.id}');
        } catch (error, stack) {
          _logger.e('Error sync for ${object.id}', error, stack);
          state = SyncState.error;
          errors.add(error);
        }
        object.state = state;
        _updateSendingStatus();
      }));
      if (errors.isNotEmpty) {
        this.errors = errors;
        _updateSendingStatus();
        _notificationService.sendNotification(
          title: Strings.notifications.errorTitle(),
          text: Strings.notifications.errorMessage(_order.successCount, _order.length),
          isSuccessful: false,
        );
        return false;
      }
      set = _order.getNext();
    }
    return true;
  }

  void _updateSendingStatus([bool fromTimer = false]) {
    if (errors != null) {
      _sendMessage(Message.status(SendingStatus.error(
        message: ErrorUtils.getErrorMessageFromList(errors ?? []),
      )));
      if (fromTimer) {
        _cancel();
        _sendMessage(Message.endingWork());
        if (!_syncCompleter.isCompleted) _syncCompleter.complete();
      }
      return;
    }
    final successCount = _order.successCount;
    final count = _order.length;
    if (successCount < count) {
      _sendMessage(Message.status(SendingStatus.sending(
        completedCount: successCount,
        allCount: count,
      )));
    } else {
      _sendMessage(Message.status(count > 0 ? const SendingStatus.success() : const SendingStatus.noLoading()));
      if (count > 0) {
        _notificationService.sendNotification(
          title: Strings.notifications.successTitle(),
          text: Strings.notifications.successMessage(_order.length),
          isSuccessful: true,
        );
      }
      if (fromTimer) {
        _cancel();
        _sendMessage(Message.endingWork());
        if (!_syncCompleter.isCompleted) _syncCompleter.complete();
      }
    }
  }

  Future<void> _settingService() async {
    if (!_isRefresh) {
      _subMessage = _messageService.getMessages().listen(_receiveMessage);
    }
    await _clearSyncing();
    await _sendWaitingConfirm();
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

  void _receiveMessage(Message message) {
    message.when(
      status: (_) {
        // ignore in background
      },
      updated: _updated,
      endingWork: () {
        // ignore in background
      },
      confirmUpdated: _confirmUpdated,
      retry: _retrySending,
    );
  }

  Future<void> _updated(
    List<Planter> planters,
    List<Trial> trials,
    List<Planting> plantings,
  ) async {
    await _updatePlanters(planters);
    await _updateTrials(trials);
    await _updatePlantings(plantings);
  }

  Future<void> _sendWaitingConfirm() async {
    await _sendMessage(
      Message.updated(
        planters: await _planterInteractor.getWaitingConfirm(),
        trials: await _trialInteractor.getWaitingConfirm(),
        plantings: await _plantingInteractor.getWaitingConfirm(),
      ),
    );
  }

  Future<void> _updatePlanters(List<Planter> planters) async {
    if (planters.isEmpty) return;
    await Future.wait(planters.map(_updatePlanter));
  }

  Future<void> _updatePlanter(Planter planter) async {
    final current = await _planterInteractor.getPlanterById(planter.internalId).first;
    final newPlanter = planter.copyWith(
      id: current?.id ?? planter.id,
      syncStatus: current == null || current.syncStatus == SyncStatus.waitingInsert
          ? SyncStatus.waitingInsert
          : current.syncStatus == SyncStatus.inserting
              ? SyncStatus.changedBeforeInsert
              : SyncStatus.waitingUpdate,
    );
    await _planterInteractor.savePlanter(newPlanter);
  }

  Future<void> _updateTrials(List<Trial> trials) async {
    if (trials.isEmpty) return;
    await Future.wait(trials.map(_updateTrial));
  }

  Future<void> _updateTrial(Trial trial) async {
    final current = await _trialInteractor.getTrialById(trial.internalId).first;
    final newTrial = trial.copyWith(
      id: current?.id ?? trial.id,
      syncStatus: current == null || current.syncStatus == SyncStatus.waitingInsert
          ? SyncStatus.waitingInsert
          : current.syncStatus == SyncStatus.inserting
              ? SyncStatus.changedBeforeInsert
              : SyncStatus.waitingUpdate,
    );
    await _trialInteractor.saveTrial(newTrial);
  }

  Future<void> _updatePlantings(List<Planting> plantings) async {
    if (plantings.isEmpty) return;
    await Future.wait(plantings.map(_updatePlanting));
  }

  Future<void> _updatePlanting(Planting planting) async {
    final current = await _plantingInteractor.getPlantingById(planting.internalId).first;
    final newPlanting = planting.copyWith(
      plantingId: current?.plantingId ?? planting.plantingId,
      syncStatus: current == null || current.syncStatus == SyncStatus.waitingInsert
          ? SyncStatus.waitingInsert
          : current.syncStatus == SyncStatus.inserting
              ? SyncStatus.changedBeforeInsert
              : SyncStatus.waitingUpdate,
    );
    await _plantingInteractor.savePlanting(newPlanting);
  }

  Future<void> _confirmUpdated(
    List<int> planterIds,
    List<int> trialIds,
    List<int> plantingIds,
  ) async {
    await Future.wait(planterIds.map((e) => _planterInteractor.markAsConfirmed(e)));
    await Future.wait(trialIds.map((e) => _trialInteractor.markAsConfirmed(e)));
    await Future.wait(plantingIds.map((e) => _plantingInteractor.markAsConfirmed(e)));
  }

  Future<void> _clearSyncing() async {
    await _planterInteractor.clearSyncing();
    await _trialInteractor.clearSyncing();
    await _plantingInteractor.clearSyncing();
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
    final planter = await _planterInteractor.syncPlanter(id);
    if (planter == null) return;
    _sendMessage(Message.updated(planters: [planter]));
  }

  Future<void> _syncTrial(int id) async {
    final trial = await _trialInteractor.syncTrial(id);
    if (trial == null) return;
    _sendMessage(Message.updated(trials: [trial]));
  }

  Future<void> _syncPlanting(int id) async {
    final planting = await _plantingInteractor.syncPlanting(id);
    if (planting == null) return;
    _sendMessage(Message.updated(plantings: [planting]));
  }
}
