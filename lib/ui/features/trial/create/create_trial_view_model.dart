import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:offsite_trial_establishment_app/common/extensions/string_ext.dart';
import 'package:offsite_trial_establishment_app/common/routes/app_router.dart';
import 'package:offsite_trial_establishment_app/domain/interactors/trial_interactor.dart';
import 'package:offsite_trial_establishment_app/domain/models/company.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';
import 'package:offsite_trial_establishment_app/ui/features/app_view_model.dart';

part 'create_trial_view_model.g.dart';

@Injectable(as: CreateTrialViewModel)
class CreateTrialStore = CreateTrialStoreBase with _$CreateTrialStore;

abstract class CreateTrialStoreBase extends CreateTrialViewModel with Store {
  final AppRouter _router;
  final TrialInteractor _interactor;

  @observable
  int _pageIndex = -1;

  @observable
  List<int> _orderedInternalIds = [];

  @readonly
  Trial? _trial;

  @override
  @computed
  bool get activePreviousButton => _pageIndex >= 0;

  @override
  @computed
  bool get activeNextButton => _pageIndex + 1 < _orderedInternalIds.length;

  @override
  @computed
  DateTime? get titleDate => activePreviousButton ? _trial?.modifiedDate : null;

  StreamSubscription? _idsSub;
  int _currentId = 0;

  set __trial(Trial? trial) {
    _trial = trial;
    if (_pageIndex == -1) {
      _newTrial = _trial;
    }
  }

  Trial? _newTrial;

  CreateTrialStoreBase(
    this._router,
    this._interactor,
  ) {
    _generateId();
    _settingSubs();
  }

  @override
  void dispose() {
    _idsSub?.cancel();
    _idsSub = null;
    super.dispose();
  }

  @action
  @override
  void updateTrialNickname(String nickname) {
    __trial = _getTrial().copyWith(nickname: nickname);
  }

  @action
  @override
  void updateContactId(String id) {
    __trial = _getTrial().copyWith(
      contact: _getContact().copyWith(
        id: id,
      ),
    );
  }

  @action
  @override
  void updateOrganization(String organization) {
    __trial = _getTrial().copyWith(
      contact: _getContact().copyWith(
        organization: organization,
      ),
    );
  }

  @action
  @override
  void updateLastName(String lastName) {
    __trial = _getTrial().copyWith(
      contact: _getContact().copyWith(
        lastName: lastName,
      ),
    );
  }

  @action
  @override
  void updateFirstName(String firstName) {
    __trial = _getTrial().copyWith(
      contact: _getContact().copyWith(
        firstName: firstName,
      ),
    );
  }

  @action
  @override
  void updatePhone(String phone) {
    __trial = _getTrial().copyWith(
      contact: _getContact().copyWith(
        phone: phone.phoneDigits,
      ),
    );
  }

  @action
  @override
  void updateEmail(String email) {
    __trial = _getTrial().copyWith(
      contact: _getContact().copyWith(
        email: email,
      ),
    );
  }

  @action
  @override
  void updateObjective(String objective) {
    __trial = _getTrial().copyWith(objective: objective);
  }

  @override
  @action
  void openNext() {
    if (!activeNextButton) return;
    _pageIndex++;
    _currentId = _orderedInternalIds[_pageIndex];
    _loadTrial();
  }

  @override
  void openPrevious() {
    if (!activePreviousButton) return;
    _pageIndex--;
    if (_pageIndex == -1) {
      _currentId = 0;
      _trial = _newTrial;
    } else {
      _currentId = _orderedInternalIds[_pageIndex];
      _loadTrial();
    }
  }

  @override
  @action
  Future<void> save() async {
    final trial = _getTrial().copyWith(modifiedDate: DateTime.now());
    _router.pop(await _interactor.saveTrial(trial));
  }

  @action
  Future<void> _generateId() async {
    final id = await _interactor.generateUniqueId();
    if (_pageIndex == -1) {
      _trial = _getTrial().copyWith(id: id);
      _newTrial = _trial;
    } else {
      _newTrial = _getNewTrial().copyWith(id: id);
    }
  }

  @action
  void _updateIds(List<int> ids) {
    _orderedInternalIds = ids;
    _pageIndex = _orderedInternalIds.indexOf(_trial?.internalId ?? 0);
    if (_pageIndex == -1) {
      _trial = _newTrial;
    }
  }

  @action
  Future<void> _loadTrial() async {
    _trial = await _interactor.getTrialById(_currentId).first;
  }

  void _settingSubs() {
    _idsSub = _interactor.getInternalIdsInOrder().listen(_updateIds);
  }

  Trial _getTrial() => _trial ?? Trial.create();

  Trial _getNewTrial() => _newTrial ?? Trial.create();

  Company _getContact() => _getTrial().contact ?? Company.create();
}

abstract class CreateTrialViewModel extends AppViewModel {
  Trial? get trial;

  bool get activePreviousButton;

  bool get activeNextButton;

  DateTime? get titleDate;

  void updateTrialNickname(String nickname);

  void updateContactId(String id);

  void updateOrganization(String organization);

  void updateLastName(String lastName);

  void updateFirstName(String firstName);

  void updateEmail(String email);

  void updatePhone(String phone);

  void updateObjective(String objective);

  void openNext();

  void openPrevious();

  Future<void> save();
}
