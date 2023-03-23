import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:offsite_trial_establishment_app/common/extensions/iterable_ext.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/planting_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/trial_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/dialog.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/location.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/planting.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/preparation.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/site.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/smr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/snr.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/soil.dart';
import 'package:offsite_trial_establishment_app/domain/models/info/species.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/domain/services/image_service.dart';
import 'package:offsite_trial_establishment_app/domain/services/location_service.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_view_model.dart';
import 'package:offsite_trial_establishment_app/ui/models/filtered_trial.dart';

part 'create_planting_view_model.g.dart';

@Injectable(as: CreatePlantingViewModel)
class CreatePlantingStore = CreatePlantingStoreBase with _$CreatePlantingStore;

abstract class CreatePlantingStoreBase extends CreatePlantingViewModel with Store {
  final AppRouter _router;
  final PlantingInteractor _interactor;
  final TrialInteractor _trialInteractor;
  final LocationService _locationService;
  final ImageService _imageService;

  @observable
  int _pageIndex = -1;

  @observable
  String? _photoDirectory;

  @observable
  List<int> _orderedInternalIds = [];

  @readonly
  Planting? _planting;

  @readonly
  List<FilteredTrial> _trials = [];

  Planting? _newPlanting;

  @override
  @computed
  bool get activePreviousButton => _pageIndex >= 0;

  @override
  @computed
  List<String> get photoPaths {
    if (_photoDirectory == null || _planting == null) return [];
    return _planting!.photoPaths.mapList((e) => '$_photoDirectory/$e');
  }

  @override
  @computed
  bool get activeNextButton => _pageIndex + 1 < _orderedInternalIds.length;

  @override
  @computed
  bool get canChangePhotos => _pageIndex == -1;

  @override
  @computed
  DateTime? get titleDate => activePreviousButton ? _planting?.modifiedDate : null;

  StreamSubscription? _locationSub;
  StreamSubscription? _trialsSub;
  StreamSubscription? _idsSub;
  int _currentId = 0;

  set __planting(Planting? planting) {
    _planting = planting;
    if (_pageIndex == -1) {
      _newPlanting = _planting;
    }
  }

  CreatePlantingStoreBase(
    this._router,
    this._interactor,
    this._trialInteractor,
    this._locationService,
    this._imageService,
  ) {
    _loadPrevious();
  }

  @override
  void dispose() {
    _locationSub?.cancel();
    _locationSub = null;
    _trialsSub?.cancel();
    _trialsSub = null;
    _idsSub?.cancel();
    _idsSub = null;
    super.dispose();
  }

  @override
  @action
  Future<void> addPhoto() async {
    final photos = await _imageService.pickImage();
    if (photos.isNotEmpty) {
      _planting = _planting?.copyWith(photoPaths: [
        ...(_planting?.photoPaths ?? []),
        ...photos,
      ]);
    }
  }

  @override
  @action
  Future<void> removePhoto(String path) async {
    final newList = <String>[...(_planting?.photoPaths ?? [])];
    if (_photoDirectory != null) {
      newList.remove(path.substring(_photoDirectory!.length + 1));
    } else {
      newList.remove(path);
    }
    _planting = _planting?.copyWith(photoPaths: newList);
    await _imageService.deleteImage(path);
  }

  @override
  @action
  Future<void> createTrial() async {
    final result = await _router.push(CreateTrialRoute());
    if (result is Trial) {
      __planting = _planting?.copyWith(trial: result);
    }
  }

  @override
  @action
  void openNext() {
    if (!activeNextButton) return;
    _pageIndex++;
    _currentId = _orderedInternalIds[_pageIndex];
    _loadPlanting();
  }

  @override
  void openPrevious() {
    if (!activePreviousButton) return;
    _pageIndex--;
    if (_pageIndex == -1) {
      _currentId = 0;
      _planting = _newPlanting;
    } else {
      _currentId = _orderedInternalIds[_pageIndex];
      _loadPlanting();
    }
  }

  @override
  @action
  Future<void> save() async {
    await _interactor.savePlanting(_planting?.copyWith(modifiedDate: DateTime.now()) ?? Planting.create());
    _router.pop();
  }

  @override
  @action
  void selectTrial(Trial? trial) {
    __planting = _planting?.copyWith(trial: trial);
  }

  @override
  @action
  void updateDate() {
    dialog = Dialog.datePicker(
      initialDate: _planting?.date ?? DateTime.now(),
      onSelected: _updateDate,
    );
  }

  @override
  @action
  void updateBlockId(String blockId) {
    __planting = _planting?.copyWith(blockId: blockId);
  }

  @override
  @action
  Future<void> updateLocation() async {
    __planting = _planting?.copyWith(location: await _locationService.getNowLocation());
  }

  @override
  @action
  void updateLatitude(String latitude) {
    _cancelLocationStreamIfNeed();
    __planting = _planting?.copyWith(
      location: _getLocation().copyWith(
        latitude: double.tryParse(latitude.doubleOnly),
      ),
    );
  }

  @override
  @action
  void updateLongitude(String longitude) {
    _cancelLocationStreamIfNeed();
    __planting = _planting?.copyWith(
      location: _getLocation().copyWith(
        longitude: double.tryParse(longitude.doubleOnly),
      ),
    );
  }

  @override
  @action
  void updateElevation(String elevation) {
    _cancelLocationStreamIfNeed();
    __planting = _planting?.copyWith(
      location: _getLocation().copyWith(
        elevation: int.tryParse(elevation.signedDigitsOnly),
      ),
    );
  }

  @override
  @action
  void updateSeries(String series) {
    __planting = _planting?.copyWith(
      site: _getSite().copyWith(
        series: series,
      ),
    );
  }

  @override
  @action
  void selectSmr(Smr? smr) {
    __planting = _planting?.copyWith(
      site: _getSite().copyWith(
        smr: smr,
      ),
    );
  }

  @override
  @action
  void selectSnr(Snr? snr) {
    __planting = _planting?.copyWith(
      site: _getSite().copyWith(
        snr: snr,
      ),
    );
  }

  @override
  @action
  void selectSoil(Soil? soil) {
    __planting = _planting?.copyWith(
      site: _getSite().copyWith(
        soil: soil,
      ),
    );
  }

  @override
  @action
  void selectPreparation(Preparation? preparation) {
    __planting = _planting?.copyWith(
      site: _getSite().copyWith(
        preparation: preparation,
      ),
    );
  }

  @override
  @action
  void updateCount(String count) {
    __planting = _planting?.copyWith(
      seedlings: _planting?.seedlings?.copyWith(
        count: int.tryParse(count.digitsOnly) ?? -1,
      ),
    );
  }

  @override
  void updateSpecies(Species? species) {
    __planting = _planting?.copyWith(seedlings: _planting?.seedlings?.copyWith(species: species));
  }

  @override
  @action
  void updateSeedlot(String seedlot) {
    __planting = _planting?.copyWith(seedlings: _planting?.seedlings?.copyWith(seedlot: seedlot));
  }

  @override
  @action
  void updateSpacing(String spacing) {
    __planting = _planting?.copyWith(
      seedlings: _planting?.seedlings?.copyWith(
        spacing: double.tryParse(spacing.doubleOnly) ?? -1,
      ),
    );
  }

  @override
  @action
  void updateNotes(String notes) {
    __planting = _planting?.copyWith(
      seedlings: _planting?.seedlings?.copyWith(
        notes: notes,
      ),
    );
  }

  @action
  Future<void> _loadPrevious() async {
    final last = await _interactor.getLast();
    final planting = Planting.create(from: last);
    _planting = planting;
    _settingSubs();
    _loadDirectory();
    _generatePlantingId();
  }

  @action
  void _updateLocation(Location location) {
    if (_pageIndex == -1) {
      __planting = _planting?.copyWith(location: location);
    } else {
      _newPlanting = _newPlanting?.copyWith(location: location);
    }
  }

  @action
  void _updateTrials(List<Trial> trials) {
    _trials = trials.mapList((e) => FilteredTrial(e));
  }

  @action
  void _updateDate(DateTime date) {
    __planting = _planting?.copyWith(date: date);
  }

  @action
  Future<void> _generatePlantingId() async {
    final id = await _interactor.generateUniqueId();
    __planting = _planting?.copyWith(plantingId: id);
  }

  @action
  Future<void> _loadDirectory() async {
    _photoDirectory = (await _imageService.getDirectory()).path;
  }

  @action
  void _updateIds(List<int> ids) {
    _orderedInternalIds = ids;
    _pageIndex = _orderedInternalIds.indexOf(_planting?.internalId ?? 0);
    if (_pageIndex == -1) {
      _planting = _newPlanting;
    }
  }

  @action
  Future<void> _loadPlanting() async {
    _planting = await _interactor.getPlantingById(_currentId).first;
  }

  void _settingSubs() {
    _locationSub = _locationService.getLocationStream().listen(_updateLocation);
    _trialsSub = _trialInteractor.getAll().listen(_updateTrials);
    _idsSub = _interactor.getInternalIdsInOrder().listen(_updateIds);
  }

  void _cancelLocationStreamIfNeed() {
    if (_pageIndex == -1) {
      _locationSub?.cancel();
      _locationSub = null;
    }
  }

  Site _getSite() => _planting?.site ?? Site.create();

  Location _getLocation() => _planting?.location ?? Location.create();
}

abstract class CreatePlantingViewModel extends AppViewModel {
  Planting? get planting;

  List<String> get photoPaths;

  bool get activePreviousButton;

  bool get activeNextButton;

  bool get canChangePhotos;

  DateTime? get titleDate;

  List<FilteredTrial> get trials;

  Future<void> addPhoto();

  Future<void> removePhoto(String path);

  Future<void> createTrial();

  void updateBlockId(String blockId);

  Future<void> updateLocation();

  void updateLatitude(String latitude);

  void updateLongitude(String longitude);

  void updateElevation(String elevation);

  void selectTrial(Trial? trial);

  void updateDate();

  void updateSeries(String series);

  void selectSmr(Smr? smr);

  void selectSnr(Snr? snr);

  void selectSoil(Soil? soil);

  void selectPreparation(Preparation? preparation);

  void updateCount(String count);

  void updateSpecies(Species? species);

  void updateSeedlot(String seedlot);

  void updateSpacing(String spacing);

  void updateNotes(String notes);

  void openNext();

  void openPrevious();

  Future<void> save();
}
