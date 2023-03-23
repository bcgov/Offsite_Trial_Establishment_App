import 'package:objectbox/objectbox.dart';

@Entity()
class CompanyEntity {
  @Id(assignable: true)
  int dbId;
  @Unique()
  final String companyId;
  final String organization;
  final String lastName;
  final String firstName;
  final String email;
  final String phone;

  CompanyEntity({
    this.dbId = 0,
    required this.companyId,
    required this.organization,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.phone,
  });
}
