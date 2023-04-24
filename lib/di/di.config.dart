// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:awesome_notifications/awesome_notifications.dart' as _i4;
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i32;
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart'
    as _i3;
import 'package:offsite_trial_establishment_app/common/utils/object_box_manager.dart'
    as _i20;
import 'package:offsite_trial_establishment_app/common/utils/postgres_manager.dart'
    as _i21;
import 'package:offsite_trial_establishment_app/data/interactors/default_planter_interactor.dart'
    as _i38;
import 'package:offsite_trial_establishment_app/data/interactors/default_planting_interactor.dart'
    as _i41;
import 'package:offsite_trial_establishment_app/data/interactors/default_trial_interactor.dart'
    as _i43;
import 'package:offsite_trial_establishment_app/data/repositories/planter/object_box_local_planter_repository.dart'
    as _i13;
import 'package:offsite_trial_establishment_app/data/repositories/planter/postgres_remote_planter_repository.dart'
    as _i23;
import 'package:offsite_trial_establishment_app/data/repositories/planting/object_box_local_planting_repository.dart'
    as _i15;
import 'package:offsite_trial_establishment_app/data/repositories/planting/postgres_remote_planting_repository.dart'
    as _i25;
import 'package:offsite_trial_establishment_app/data/repositories/trial/object_box_local_trial_repository.dart'
    as _i17;
import 'package:offsite_trial_establishment_app/data/repositories/trial/postgres_remote_trial_repository.dart'
    as _i27;
import 'package:offsite_trial_establishment_app/data/services/awesome_notification_service.dart'
    as _i36;
import 'package:offsite_trial_establishment_app/data/services/connectivity_connect_service.dart'
    as _i31;
import 'package:offsite_trial_establishment_app/data/services/default_error_service.dart'
    as _i7;
import 'package:offsite_trial_establishment_app/data/services/default_image_service.dart'
    as _i9;
import 'package:offsite_trial_establishment_app/data/services/default_lifecycle_service.dart'
    as _i11;
import 'package:offsite_trial_establishment_app/data/services/default_location_service.dart'
    as _i19;
import 'package:offsite_trial_establishment_app/data/services/default_validation_service.dart'
    as _i29;
import 'package:offsite_trial_establishment_app/data/services/sync/default_message_service.dart'
    as _i34;
import 'package:offsite_trial_establishment_app/data/services/sync/ordered_background_sync_service.dart'
    as _i45;
import 'package:offsite_trial_establishment_app/data/services/sync/ordered_foreground_sync_service.dart'
    as _i49;
import 'package:offsite_trial_establishment_app/di/background_module.dart'
    as _i51;
import 'package:offsite_trial_establishment_app/di/connectivity_module.dart'
    as _i52;
import 'package:offsite_trial_establishment_app/di/db_module.dart' as _i53;
import 'package:offsite_trial_establishment_app/di/log_module.dart' as _i54;
import 'package:offsite_trial_establishment_app/di/notification_module.dart'
    as _i55;
import 'package:offsite_trial_establishment_app/di/postgres_module.dart'
    as _i56;
import 'package:offsite_trial_establishment_app/domain/interactors/planter_interactor.dart'
    as _i37;
import 'package:offsite_trial_establishment_app/domain/interactors/planting_interactor.dart'
    as _i40;
import 'package:offsite_trial_establishment_app/domain/interactors/trial_interactor.dart'
    as _i42;
import 'package:offsite_trial_establishment_app/domain/repositories/planter/local_planter_repository.dart'
    as _i12;
import 'package:offsite_trial_establishment_app/domain/repositories/planter/remote_planter_repository.dart'
    as _i22;
import 'package:offsite_trial_establishment_app/domain/repositories/planting/local_planting_repository.dart'
    as _i14;
import 'package:offsite_trial_establishment_app/domain/repositories/planting/remote_planting_repository.dart'
    as _i24;
import 'package:offsite_trial_establishment_app/domain/repositories/trial/local_trial_repository.dart'
    as _i16;
import 'package:offsite_trial_establishment_app/domain/repositories/trial/remote_trial_repository.dart'
    as _i26;
import 'package:offsite_trial_establishment_app/domain/services/background_sync_service.dart'
    as _i44;
import 'package:offsite_trial_establishment_app/domain/services/connect_service.dart'
    as _i30;
import 'package:offsite_trial_establishment_app/domain/services/error_service.dart'
    as _i6;
import 'package:offsite_trial_establishment_app/domain/services/foreground_sync_service.dart'
    as _i48;
import 'package:offsite_trial_establishment_app/domain/services/image_service.dart'
    as _i8;
import 'package:offsite_trial_establishment_app/domain/services/lifecycle_service.dart'
    as _i10;
import 'package:offsite_trial_establishment_app/domain/services/location_service.dart'
    as _i18;
import 'package:offsite_trial_establishment_app/domain/services/message_service.dart'
    as _i33;
import 'package:offsite_trial_establishment_app/domain/services/notification_service.dart'
    as _i35;
import 'package:offsite_trial_establishment_app/domain/services/validation_service.dart'
    as _i28;
import 'package:offsite_trial_establishment_app/ui/features/home/home_view_model.dart'
    as _i50;
import 'package:offsite_trial_establishment_app/ui/features/planter/setup/planter_setup_view_model.dart'
    as _i39;
import 'package:offsite_trial_establishment_app/ui/features/planting/create/create_planting_view_model.dart'
    as _i46;
import 'package:offsite_trial_establishment_app/ui/features/trial/create/create_trial_view_model.dart'
    as _i47;

const String _prod_refresh = 'prod_refresh';
const String _dev_refresh = 'dev_refresh';
const String _test_refresh = 'test_refresh';
const String _prod_sync = 'prod_sync';
const String _dev_sync = 'dev_sync';
const String _test_sync = 'test_sync';
const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final notificationModule = _$NotificationModule();
    final connectivityModule = _$ConnectivityModule();
    final dbModule = _$DbModule();
    final postgresModule = _$PostgresModule();
    final backgroundModule = _$BackgroundModule();
    final logModule = _$LogModule();
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.lazySingleton<_i4.AwesomeNotifications>(
        () => notificationModule.notifications());
    gh.lazySingleton<_i5.Connectivity>(() => connectivityModule.connectivity);
    gh.lazySingleton<_i6.ErrorService>(
        () => _i7.DefaultErrorService(gh<_i3.AppRouter>()));
    gh.factory<_i8.ImageService>(() => _i9.DefaultImageService());
    gh.singleton<_i10.LifecycleService>(_i11.DefaultLifecycleService());
    gh.lazySingleton<_i12.LocalPlanterRepository>(
        () => _i13.ObjectBoxLocalPlanterRepository());
    gh.lazySingleton<_i14.LocalPlantingRepository>(
        () => _i15.ObjectBoxLocalPlantingRepository());
    gh.lazySingleton<_i16.LocalTrialRepository>(
        () => _i17.ObjectBoxLocalTrialRepository());
    gh.lazySingleton<_i18.LocationService>(() => _i19.DefaultLocationService());
    await gh.lazySingletonAsync<_i20.ObjectBoxManager>(
      () => dbModule.objectBoxManagerBackground,
      registerFor: {
        _prod_refresh,
        _dev_refresh,
        _test_refresh,
        _prod_sync,
        _dev_sync,
        _test_sync,
      },
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i20.ObjectBoxManager>(
      () => dbModule.objectBoxManager,
      registerFor: {
        _prod,
        _dev,
        _test,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i21.PostgresManager>(() => postgresModule.connection());
    gh.lazySingleton<_i22.RemotePlanterRepository>(
        () => _i23.PostgresRemotePlanterRepository(gh<_i21.PostgresManager>()));
    gh.lazySingleton<_i24.RemotePlantingRepository>(
        () => _i25.PostgresRemotePlantingRepository(
              gh<_i21.PostgresManager>(),
              gh<_i8.ImageService>(),
            ));
    gh.lazySingleton<_i26.RemoteTrialRepository>(
        () => _i27.PostgresRemoteTrialRepository(gh<_i21.PostgresManager>()));
    gh.lazySingleton<String>(
      () => backgroundModule.backgroundTaskIdentifier,
      instanceName: 'task_identifier',
      registerFor: {
        _prod_refresh,
        _dev_refresh,
        _test_refresh,
        _prod_sync,
        _dev_sync,
        _test_sync,
      },
    );
    gh.lazySingleton<String>(
      () => backgroundModule.foregroundTaskIdentifier,
      instanceName: 'task_identifier',
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.lazySingleton<String>(
      () => logModule.foreground,
      instanceName: 'log_file',
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.lazySingleton<String>(
      () => logModule.background,
      instanceName: 'log_file',
      registerFor: {
        _prod_refresh,
        _dev_refresh,
        _test_refresh,
        _prod_sync,
        _dev_sync,
        _test_sync,
      },
    );
    gh.lazySingleton<_i28.ValidationService>(
        () => _i29.DefaultValidationService());
    gh.lazySingleton<bool>(
      () => backgroundModule.refreshIsRefresh,
      instanceName: 'is_refresh',
      registerFor: {
        _prod_refresh,
        _dev_refresh,
        _test_refresh,
      },
    );
    gh.lazySingleton<bool>(
      () => backgroundModule.foregroundIsRefresh,
      instanceName: 'is_refresh',
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.lazySingleton<bool>(
      () => backgroundModule.background,
      instanceName: 'is_foreground',
      registerFor: {
        _prod_refresh,
        _dev_refresh,
        _test_refresh,
        _prod_sync,
        _dev_sync,
        _test_sync,
      },
    );
    gh.lazySingleton<bool>(
      () => backgroundModule.foreground,
      instanceName: 'is_foreground',
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.lazySingleton<bool>(
      () => backgroundModule.syncIsRefresh,
      instanceName: 'is_refresh',
      registerFor: {
        _prod_sync,
        _dev_sync,
        _test_sync,
      },
    );
    gh.lazySingleton<_i30.ConnectService>(
        () => _i31.ConnectivityConnectService(gh<_i5.Connectivity>()));
    await gh.lazySingletonAsync<_i32.Logger>(
      () => logModule.logger(gh<String>(instanceName: 'log_file')),
      preResolve: true,
    );
    gh.lazySingleton<_i33.MessageService>(() => _i34.DefaultMessageService(
          gh<String>(instanceName: 'task_identifier'),
          gh<bool>(instanceName: 'is_refresh'),
        ));
    gh.singleton<_i35.NotificationService>(_i36.AwesomeNotificationService(
      gh<_i4.AwesomeNotifications>(),
      gh<bool>(instanceName: 'is_foreground'),
    ));
    gh.lazySingleton<_i37.PlanterInteractor>(
        () => _i38.DefaultPlanterInteractor(
              gh<_i12.LocalPlanterRepository>(),
              gh<_i28.ValidationService>(),
              gh<_i22.RemotePlanterRepository>(),
            ));
    gh.factoryParam<_i39.PlanterSetupViewModel, bool?, dynamic>((
      isCreating,
      _,
    ) =>
        _i39.PlanterSetupStore(
          gh<_i3.AppRouter>(),
          gh<_i37.PlanterInteractor>(),
          isCreating,
        ));
    gh.lazySingleton<_i40.PlantingInteractor>(
        () => _i41.DefaultPlantingInteractor(
              gh<_i14.LocalPlantingRepository>(),
              gh<_i24.RemotePlantingRepository>(),
              gh<_i12.LocalPlanterRepository>(),
              gh<_i28.ValidationService>(),
            ));
    gh.lazySingleton<_i42.TrialInteractor>(() => _i43.DefaultTrialInteractor(
          gh<_i16.LocalTrialRepository>(),
          gh<_i12.LocalPlanterRepository>(),
          gh<_i28.ValidationService>(),
          gh<_i26.RemoteTrialRepository>(),
        ));
    gh.lazySingleton<_i44.BackgroundSyncService>(
      () => _i45.OrderedBackgroundSyncService(
        gh<_i37.PlanterInteractor>(),
        gh<_i40.PlantingInteractor>(),
        gh<_i42.TrialInteractor>(),
        gh<_i35.NotificationService>(),
        gh<_i33.MessageService>(),
        gh<bool>(instanceName: 'is_refresh'),
      ),
      registerFor: {
        _prod_refresh,
        _dev_refresh,
        _test_refresh,
        _prod_sync,
        _dev_sync,
        _test_sync,
      },
    );
    gh.factory<_i46.CreatePlantingViewModel>(() => _i46.CreatePlantingStore(
          gh<_i3.AppRouter>(),
          gh<_i40.PlantingInteractor>(),
          gh<_i42.TrialInteractor>(),
          gh<_i18.LocationService>(),
          gh<_i8.ImageService>(),
        ));
    gh.factory<_i47.CreateTrialViewModel>(() => _i47.CreateTrialStore(
          gh<_i3.AppRouter>(),
          gh<_i42.TrialInteractor>(),
        ));
    gh.lazySingleton<_i48.ForegroundSyncService>(
      () => _i49.OrderedForegroundSyncService(
        gh<_i37.PlanterInteractor>(),
        gh<_i40.PlantingInteractor>(),
        gh<_i42.TrialInteractor>(),
        gh<_i30.ConnectService>(),
        gh<_i33.MessageService>(),
        gh<_i20.ObjectBoxManager>(),
      ),
      registerFor: {
        _prod,
        _dev,
        _test,
      },
    );
    gh.factory<_i50.HomeViewModel>(() => _i50.HomeStore(
          gh<_i3.AppRouter>(),
          gh<_i48.ForegroundSyncService>(),
        ));
    return this;
  }
}

class _$BackgroundModule extends _i51.BackgroundModule {}

class _$ConnectivityModule extends _i52.ConnectivityModule {}

class _$DbModule extends _i53.DbModule {}

class _$LogModule extends _i54.LogModule {}

class _$NotificationModule extends _i55.NotificationModule {}

class _$PostgresModule extends _i56.PostgresModule {}
