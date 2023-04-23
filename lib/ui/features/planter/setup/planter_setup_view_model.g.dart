// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planter_setup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlanterSetupStore on PlanterSetupStoreBase, Store {
  late final _$_planterAtom =
      Atom(name: 'PlanterSetupStoreBase._planter', context: context);

  Planter? get planter {
    _$_planterAtom.reportRead();
    return super._planter;
  }

  @override
  Planter? get _planter => planter;

  @override
  set _planter(Planter? value) {
    _$_planterAtom.reportWrite(value, super._planter, () {
      super._planter = value;
    });
  }

  late final _$loadPlanterInfoAsyncAction =
      AsyncAction('PlanterSetupStoreBase.loadPlanterInfo', context: context);

  @override
  Future<void> loadPlanterInfo() {
    return _$loadPlanterInfoAsyncAction.run(() => super.loadPlanterInfo());
  }

  late final _$saveAsyncAction =
      AsyncAction('PlanterSetupStoreBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$logoutAsyncAction =
      AsyncAction('PlanterSetupStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_generateIdAsyncAction =
      AsyncAction('PlanterSetupStoreBase._generateId', context: context);

  @override
  Future<void> _generateId() {
    return _$_generateIdAsyncAction.run(() => super._generateId());
  }

  late final _$PlanterSetupStoreBaseActionController =
      ActionController(name: 'PlanterSetupStoreBase', context: context);

  @override
  void updateNickname(String nickname) {
    final _$actionInfo = _$PlanterSetupStoreBaseActionController.startAction(
        name: 'PlanterSetupStoreBase.updateNickname');
    try {
      return super.updateNickname(nickname);
    } finally {
      _$PlanterSetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLastName(String lastName) {
    final _$actionInfo = _$PlanterSetupStoreBaseActionController.startAction(
        name: 'PlanterSetupStoreBase.updateLastName');
    try {
      return super.updateLastName(lastName);
    } finally {
      _$PlanterSetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFirstName(String firstName) {
    final _$actionInfo = _$PlanterSetupStoreBaseActionController.startAction(
        name: 'PlanterSetupStoreBase.updateFirstName');
    try {
      return super.updateFirstName(firstName);
    } finally {
      _$PlanterSetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateEmail(String email) {
    final _$actionInfo = _$PlanterSetupStoreBaseActionController.startAction(
        name: 'PlanterSetupStoreBase.updateEmail');
    try {
      return super.updateEmail(email);
    } finally {
      _$PlanterSetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePhone(String phone) {
    final _$actionInfo = _$PlanterSetupStoreBaseActionController.startAction(
        name: 'PlanterSetupStoreBase.updatePhone');
    try {
      return super.updatePhone(phone);
    } finally {
      _$PlanterSetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateOrganization(String organization) {
    final _$actionInfo = _$PlanterSetupStoreBaseActionController.startAction(
        name: 'PlanterSetupStoreBase.updateOrganization');
    try {
      return super.updateOrganization(organization);
    } finally {
      _$PlanterSetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updatePlanter(Planter? planter) {
    final _$actionInfo = _$PlanterSetupStoreBaseActionController.startAction(
        name: 'PlanterSetupStoreBase._updatePlanter');
    try {
      return super._updatePlanter(planter);
    } finally {
      _$PlanterSetupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
