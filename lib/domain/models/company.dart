import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required int internalId,
    required String id,
    required String organization,
    required String lastName,
    required String firstName,
    required String email,
    required String phone,
  }) = _Company;

  factory Company.create() => const Company(
        internalId: 0,
        id: '',
        organization: '',
        lastName: '',
        firstName: '',
        email: '',
        phone: '',
      );

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
