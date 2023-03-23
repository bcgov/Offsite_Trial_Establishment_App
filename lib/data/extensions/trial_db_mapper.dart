import 'package:offsite_trial_establishment_app/data/entities/company_entity.dart';
import 'package:offsite_trial_establishment_app/data/entities/trial_entity.dart';
import 'package:offsite_trial_establishment_app/data/extensions/planter_db_mapper.dart';
import 'package:offsite_trial_establishment_app/domain/models/company.dart';
import 'package:offsite_trial_establishment_app/domain/models/trial.dart';

extension TrialEntityMapper on TrialEntity {
  Trial toModel() => Trial(
        internalId: dbId,
        id: trialId,
        nickname: nickname,
        contact: contact.target?.toModel(),
        objective: objective,
        syncStatus: syncStatus,
        modifiedDate: modifiedDate,
        planter: planter.target?.toModel(),
      );
}

extension TrialMapper on Trial {
  TrialEntity toEntity({
    required int? ownerId,
  }) =>
      TrialEntity.create(
        dbId: internalId,
        trialId: id,
        nickname: nickname,
        contactId: ownerId,
        objective: objective,
        syncStatus: syncStatus,
        modifiedDate: modifiedDate,
        planterId: planter?.internalId,
      );
}

extension CompanyEntityMapper on CompanyEntity {
  Company toModel() => Company(
    internalId: dbId,
        id: companyId,
        organization: organization,
        lastName: lastName,
        firstName: firstName,
        email: email,
        phone: phone,
      );
}

extension CompanyMapper on Company {
  CompanyEntity toEntity() => CompanyEntity(
    dbId: internalId,
        companyId: id,
        organization: organization,
        lastName: lastName,
        firstName: firstName,
        email: email,
        phone: phone,
      );
}
