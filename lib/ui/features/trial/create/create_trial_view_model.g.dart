// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_trial_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateTrialStore on CreateTrialStoreBase, Store {
  Computed<bool>? _$activePreviousButtonComputed;

  @override
  bool get activePreviousButton => (_$activePreviousButtonComputed ??=
          Computed<bool>(() => super.activePreviousButton,
              name: 'CreateTrialStoreBase.activePreviousButton'))
      .value;
  Computed<bool>? _$activeNextButtonComputed;

  @override
  bool get activeNextButton => (_$activeNextButtonComputed ??= Computed<bool>(
          () => super.activeNextButton,
          name: 'CreateTrialStoreBase.activeNextButton'))
      .value;
  Computed<DateTime?>? _$titleDateComputed;

  @override
  DateTime? get titleDate =>
      (_$titleDateComputed ??= Computed<DateTime?>(() => super.titleDate,
              name: 'CreateTrialStoreBase.titleDate'))
          .value;

  late final _$_pageIndexAtom =
      Atom(name: 'CreateTrialStoreBase._pageIndex', context: context);

  @override
  int get _pageIndex {
    _$_pageIndexAtom.reportRead();
    return super._pageIndex;
  }

  @override
  set _pageIndex(int value) {
    _$_pageIndexAtom.reportWrite(value, super._pageIndex, () {
      super._pageIndex = value;
    });
  }

  late final _$_orderedInternalIdsAtom =
      Atom(name: 'CreateTrialStoreBase._orderedInternalIds', context: context);

  @override
  List<int> get _orderedInternalIds {
    _$_orderedInternalIdsAtom.reportRead();
    return super._orderedInternalIds;
  }

  @override
  set _orderedInternalIds(List<int> value) {
    _$_orderedInternalIdsAtom.reportWrite(value, super._orderedInternalIds, () {
      super._orderedInternalIds = value;
    });
  }

  late final _$_trialAtom =
      Atom(name: 'CreateTrialStoreBase._trial', context: context);

  Trial? get trial {
    _$_trialAtom.reportRead();
    return super._trial;
  }

  @override
  Trial? get _trial => trial;

  @override
  set _trial(Trial? value) {
    _$_trialAtom.reportWrite(value, super._trial, () {
      super._trial = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('CreateTrialStoreBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_generateIdAsyncAction =
      AsyncAction('CreateTrialStoreBase._generateId', context: context);

  @override
  Future<void> _generateId() {
    return _$_generateIdAsyncAction.run(() => super._generateId());
  }

  late final _$_loadTrialAsyncAction =
      AsyncAction('CreateTrialStoreBase._loadTrial', context: context);

  @override
  Future<void> _loadTrial() {
    return _$_loadTrialAsyncAction.run(() => super._loadTrial());
  }

  late final _$CreateTrialStoreBaseActionController =
      ActionController(name: 'CreateTrialStoreBase', context: context);

  @override
  void updateTrialNickname(String nickname) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updateTrialNickname');
    try {
      return super.updateTrialNickname(nickname);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateContactId(String id) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updateContactId');
    try {
      return super.updateContactId(id);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateOrganization(String organization) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updateOrganization');
    try {
      return super.updateOrganization(organization);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLastName(String lastName) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updateLastName');
    try {
      return super.updateLastName(lastName);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFirstName(String firstName) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updateFirstName');
    try {
      return super.updateFirstName(firstName);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePhone(String phone) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updatePhone');
    try {
      return super.updatePhone(phone);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateEmail(String email) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updateEmail');
    try {
      return super.updateEmail(email);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateObjective(String objective) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.updateObjective');
    try {
      return super.updateObjective(objective);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openNext() {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase.openNext');
    try {
      return super.openNext();
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateIds(List<int> ids) {
    final _$actionInfo = _$CreateTrialStoreBaseActionController.startAction(
        name: 'CreateTrialStoreBase._updateIds');
    try {
      return super._updateIds(ids);
    } finally {
      _$CreateTrialStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activePreviousButton: ${activePreviousButton},
activeNextButton: ${activeNextButton},
titleDate: ${titleDate}
    ''';
  }
}
