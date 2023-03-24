import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:offsite_trial_establishment_app/common/extensions/router_ext.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planter_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/dialog.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_view_model.dart';

part 'planter_setup_view_model.g.dart';

@Injectable(as: PlanterSetupViewModel)
class PlanterSetupStore extends PlanterSetupStoreBase with _$PlanterSetupStore {
  PlanterSetupStore(
    AppRouter router,
    PlanterInteractor interactor,
    @factoryParam bool? isCreating,
  ) : super(
          router,
          interactor,
          isCreating ?? false,
        );
}

abstract class PlanterSetupStoreBase extends PlanterSetupViewModel with Store {
  final AppRouter _router;
  final PlanterInteractor _interactor;
  @override
  final bool isCreating;

  @readonly
  Planter? _planter;

  StreamSubscription? _sub;

  PlanterSetupStoreBase(
    this._router,
    this._interactor,
    this.isCreating,
  ) {
    if (!isCreating) {
      _settingSub();
    } else {
      _generateId();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
    _sub = null;
  }

  @action
  @override
  void updateNickname(String nickname) {
    _planter = _getPlanter().copyWith(nickname: nickname, internalId: 0);
    _generateId();
  }

  @action
  @override
  void updateLastName(String lastName) {
    _planter = _getPlanter().copyWith(lastName: lastName);
  }

  @action
  @override
  void updateFirstName(String firstName) {
    _planter = _getPlanter().copyWith(firstName: firstName);
  }

  @action
  @override
  void updateEmail(String email) {
    _planter = _getPlanter().copyWith(email: email);
  }

  @action
  @override
  void updatePhone(String phone) {
    _planter = _getPlanter().copyWith(phone: phone.phoneDigits);
  }

  @action
  @override
  void updateOrganization(String organization) {
    _planter = _getPlanter().copyWith(organization: organization);
  }

  @override
  @action
  Future<void> loadPlanterInfo() async {
    if (!isCreating || _planter?.nickname.isNotBlank != true) return;
    final planter = await _interactor.getPlanterByNickname(_planter?.nickname ?? '');
    if (planter != null) _planter = planter;
  }

  @override
  @action
  Future<void> save() async {
    await _interactor.savePlanter(_getPlanter().copyWith(isActive: true));
    if (isCreating) {
      _router.replaceAll([HomeRoute()]);
    } else {
      _router.pop();
    }
  }

  @override
  @action
  Future<void> logout() async {
    dialog = Dialog.logout(onLogout: _logout);
  }

  @action
  Future<void> _generateId() async {
    final id = await _interactor.generateUniqueId();
    _planter = _getPlanter().copyWith(id: id);
  }

  @action
  void _updatePlanter(Planter? planter) {
    _planter ??= planter;
  }

  Future<void> _logout() async {
    _router.dismissActiveDialogs();
    await _interactor.logout();
    _router.replaceAll([PlanterSetupRoute(isCreating: true)]);
  }

  void _settingSub() {
    _sub = _interactor.getActivePlanter().listen(_updatePlanter);
  }

  Planter _getPlanter() => _planter ?? Planter.create();
}

abstract class PlanterSetupViewModel extends AppViewModel {
  Planter? get planter;

  bool get isCreating;

  void updateNickname(String nickname);

  void updateLastName(String lastName);

  void updateFirstName(String firstName);

  void updateEmail(String email);

  void updatePhone(String phone);

  void updateOrganization(String organization);

  Future<void> loadPlanterInfo();

  Future<void> save();

  Future<void> logout();
}
