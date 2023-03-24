import 'package:offsite_trial_establishment_app/data/entities/planter_entity.dart';
import 'package:offsite_trial_establishment_app/domain/models/planter.dart';

extension PlanterEntityMapper on PlanterEntity {
  Planter toModel() => Planter(
        internalId: dbId,
        id: planterId,
        nickname: nickname,
        lastName: lastName,
        firstName: firstName,
        email: email,
        phone: phone,
        organization: organization,
        syncStatus: syncStatus,
        isActive: isActive,
      );
}

extension PlanterMapper on Planter {
  PlanterEntity toEntity() => PlanterEntity.create(
        dbId: internalId,
        planterId: id,
        nickname: nickname,
        lastName: lastName,
        firstName: firstName,
        email: email,
        phone: phone,
        organization: organization,
        syncStatus: syncStatus,
        isActive: isActive,
      );
}
