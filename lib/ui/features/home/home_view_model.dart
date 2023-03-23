import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart';
import 'package:offsite_trial_establishment_app/domain/models/sending_status.dart';
import 'package:offsite_trial_establishment_app/domain/services/foreground_sync_service.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_view_model.dart';

part 'home_view_model.g.dart';

@Injectable(as: HomeViewModel)
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase extends HomeViewModel with Store {
  final AppRouter _router;
  final ForegroundSyncService _syncService;

  @readonly
  SendingStatus _status = const SendingStatus.noLoading();

  StreamSubscription? _sub;

  HomeStoreBase(
    this._router,
    this._syncService,
  ) {
    _settingSub();
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
    _sub = null;
  }

  @override
  void openPlanting() {
    _router.push(CreatePlantingRoute());
  }

  @override
  void openTrial() {
    _router.push(CreateTrialRoute());
  }

  @override
  void openPlanter() {
    _router.push(PlanterSetupRoute());
  }

  @override
  Future<void> retry() async {
    await _status.maybeWhen(
      orElse: () {},
      error: (message) async {
        await _syncService.retrySending();
      },
    );
  }

  @action
  void _updateStatus(SendingStatus status) {
    _status = status;
  }

  void _settingSub() {
    _sub = _syncService.getStatus().listen(_updateStatus);
  }
}

abstract class HomeViewModel extends AppViewModel {
  SendingStatus get status;

  void openPlanting();

  void openTrial();

  void openPlanter();

  Future<void> retry();
}
