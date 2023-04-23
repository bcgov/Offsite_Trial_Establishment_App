// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_planting_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatePlantingStore on CreatePlantingStoreBase, Store {
  Computed<bool>? _$activePreviousButtonComputed;

  @override
  bool get activePreviousButton => (_$activePreviousButtonComputed ??=
          Computed<bool>(() => super.activePreviousButton,
              name: 'CreatePlantingStoreBase.activePreviousButton'))
      .value;
  Computed<List<String>>? _$photoPathsComputed;

  @override
  List<String> get photoPaths =>
      (_$photoPathsComputed ??= Computed<List<String>>(() => super.photoPaths,
              name: 'CreatePlantingStoreBase.photoPaths'))
          .value;
  Computed<bool>? _$activeNextButtonComputed;

  @override
  bool get activeNextButton => (_$activeNextButtonComputed ??= Computed<bool>(
          () => super.activeNextButton,
          name: 'CreatePlantingStoreBase.activeNextButton'))
      .value;
  Computed<bool>? _$canChangePhotosComputed;

  @override
  bool get canChangePhotos =>
      (_$canChangePhotosComputed ??= Computed<bool>(() => super.canChangePhotos,
              name: 'CreatePlantingStoreBase.canChangePhotos'))
          .value;
  Computed<DateTime?>? _$titleDateComputed;

  @override
  DateTime? get titleDate =>
      (_$titleDateComputed ??= Computed<DateTime?>(() => super.titleDate,
              name: 'CreatePlantingStoreBase.titleDate'))
          .value;

  late final _$_pageIndexAtom =
      Atom(name: 'CreatePlantingStoreBase._pageIndex', context: context);

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

  late final _$_photoDirectoryAtom =
      Atom(name: 'CreatePlantingStoreBase._photoDirectory', context: context);

  @override
  String? get _photoDirectory {
    _$_photoDirectoryAtom.reportRead();
    return super._photoDirectory;
  }

  @override
  set _photoDirectory(String? value) {
    _$_photoDirectoryAtom.reportWrite(value, super._photoDirectory, () {
      super._photoDirectory = value;
    });
  }

  late final _$_orderedInternalIdsAtom = Atom(
      name: 'CreatePlantingStoreBase._orderedInternalIds', context: context);

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

  late final _$_plantingAtom =
      Atom(name: 'CreatePlantingStoreBase._planting', context: context);

  Planting? get planting {
    _$_plantingAtom.reportRead();
    return super._planting;
  }

  @override
  Planting? get _planting => planting;

  @override
  set _planting(Planting? value) {
    _$_plantingAtom.reportWrite(value, super._planting, () {
      super._planting = value;
    });
  }

  late final _$_trialsAtom =
      Atom(name: 'CreatePlantingStoreBase._trials', context: context);

  List<FilteredTrial> get trials {
    _$_trialsAtom.reportRead();
    return super._trials;
  }

  @override
  List<FilteredTrial> get _trials => trials;

  @override
  set _trials(List<FilteredTrial> value) {
    _$_trialsAtom.reportWrite(value, super._trials, () {
      super._trials = value;
    });
  }

  late final _$addPhotoAsyncAction =
      AsyncAction('CreatePlantingStoreBase.addPhoto', context: context);

  @override
  Future<void> addPhoto() {
    return _$addPhotoAsyncAction.run(() => super.addPhoto());
  }

  late final _$removePhotoAsyncAction =
      AsyncAction('CreatePlantingStoreBase.removePhoto', context: context);

  @override
  Future<void> removePhoto(String path) {
    return _$removePhotoAsyncAction.run(() => super.removePhoto(path));
  }

  late final _$createTrialAsyncAction =
      AsyncAction('CreatePlantingStoreBase.createTrial', context: context);

  @override
  Future<void> createTrial() {
    return _$createTrialAsyncAction.run(() => super.createTrial());
  }

  late final _$saveAsyncAction =
      AsyncAction('CreatePlantingStoreBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$updateLocationAsyncAction =
      AsyncAction('CreatePlantingStoreBase.updateLocation', context: context);

  @override
  Future<void> updateLocation() {
    return _$updateLocationAsyncAction.run(() => super.updateLocation());
  }

  late final _$_loadPreviousAsyncAction =
      AsyncAction('CreatePlantingStoreBase._loadPrevious', context: context);

  @override
  Future<void> _loadPrevious() {
    return _$_loadPreviousAsyncAction.run(() => super._loadPrevious());
  }

  late final _$_generatePlantingIdAsyncAction = AsyncAction(
      'CreatePlantingStoreBase._generatePlantingId',
      context: context);

  @override
  Future<void> _generatePlantingId() {
    return _$_generatePlantingIdAsyncAction
        .run(() => super._generatePlantingId());
  }

  late final _$_loadDirectoryAsyncAction =
      AsyncAction('CreatePlantingStoreBase._loadDirectory', context: context);

  @override
  Future<void> _loadDirectory() {
    return _$_loadDirectoryAsyncAction.run(() => super._loadDirectory());
  }

  late final _$_loadPlantingAsyncAction =
      AsyncAction('CreatePlantingStoreBase._loadPlanting', context: context);

  @override
  Future<void> _loadPlanting() {
    return _$_loadPlantingAsyncAction.run(() => super._loadPlanting());
  }

  late final _$CreatePlantingStoreBaseActionController =
      ActionController(name: 'CreatePlantingStoreBase', context: context);

  @override
  void openNext() {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.openNext');
    try {
      return super.openNext();
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectTrial(Trial? trial) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.selectTrial');
    try {
      return super.selectTrial(trial);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDate() {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateDate');
    try {
      return super.updateDate();
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBlockId(String blockId) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateBlockId');
    try {
      return super.updateBlockId(blockId);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLatitude(String latitude) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateLatitude');
    try {
      return super.updateLatitude(latitude);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLongitude(String longitude) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateLongitude');
    try {
      return super.updateLongitude(longitude);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateElevation(String elevation) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateElevation');
    try {
      return super.updateElevation(elevation);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSeries(String series) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateSeries');
    try {
      return super.updateSeries(series);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSmr(Smr? smr) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.selectSmr');
    try {
      return super.selectSmr(smr);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSnr(Snr? snr) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.selectSnr');
    try {
      return super.selectSnr(snr);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectSoil(Soil? soil) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.selectSoil');
    try {
      return super.selectSoil(soil);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPreparation(Preparation? preparation) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.selectPreparation');
    try {
      return super.selectPreparation(preparation);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCount(String count) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateCount');
    try {
      return super.updateCount(count);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSeedlot(String seedlot) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateSeedlot');
    try {
      return super.updateSeedlot(seedlot);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSpacing(String spacing) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateSpacing');
    try {
      return super.updateSpacing(spacing);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNotes(String notes) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase.updateNotes');
    try {
      return super.updateNotes(notes);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateLocation(Location location) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase._updateLocation');
    try {
      return super._updateLocation(location);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateTrials(List<Trial> trials) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase._updateTrials');
    try {
      return super._updateTrials(trials);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateDate(DateTime date) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase._updateDate');
    try {
      return super._updateDate(date);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateIds(List<int> ids) {
    final _$actionInfo = _$CreatePlantingStoreBaseActionController.startAction(
        name: 'CreatePlantingStoreBase._updateIds');
    try {
      return super._updateIds(ids);
    } finally {
      _$CreatePlantingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activePreviousButton: ${activePreviousButton},
photoPaths: ${photoPaths},
activeNextButton: ${activeNextButton},
canChangePhotos: ${canChangePhotos},
titleDate: ${titleDate}
    ''';
  }
}
