// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  int get internalId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get organization => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call(
      {int internalId,
      String id,
      String organization,
      String lastName,
      String firstName,
      String email,
      String phone});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internalId = null,
    Object? id = null,
    Object? organization = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$_CompanyCopyWith(
          _$_Company value, $Res Function(_$_Company) then) =
      __$$_CompanyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int internalId,
      String id,
      String organization,
      String lastName,
      String firstName,
      String email,
      String phone});
}

/// @nodoc
class __$$_CompanyCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$_Company>
    implements _$$_CompanyCopyWith<$Res> {
  __$$_CompanyCopyWithImpl(_$_Company _value, $Res Function(_$_Company) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? internalId = null,
    Object? id = null,
    Object? organization = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_$_Company(
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organization: null == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Company implements _Company {
  const _$_Company(
      {required this.internalId,
      required this.id,
      required this.organization,
      required this.lastName,
      required this.firstName,
      required this.email,
      required this.phone});

  factory _$_Company.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyFromJson(json);

  @override
  final int internalId;
  @override
  final String id;
  @override
  final String organization;
  @override
  final String lastName;
  @override
  final String firstName;
  @override
  final String email;
  @override
  final String phone;

  @override
  String toString() {
    return 'Company(internalId: $internalId, id: $id, organization: $organization, lastName: $lastName, firstName: $firstName, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Company &&
            (identical(other.internalId, internalId) ||
                other.internalId == internalId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, internalId, id, organization,
      lastName, firstName, email, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyCopyWith<_$_Company> get copyWith =>
      __$$_CompanyCopyWithImpl<_$_Company>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyToJson(
      this,
    );
  }
}

abstract class _Company implements Company {
  const factory _Company(
      {required final int internalId,
      required final String id,
      required final String organization,
      required final String lastName,
      required final String firstName,
      required final String email,
      required final String phone}) = _$_Company;

  factory _Company.fromJson(Map<String, dynamic> json) = _$_Company.fromJson;

  @override
  int get internalId;
  @override
  String get id;
  @override
  String get organization;
  @override
  String get lastName;
  @override
  String get firstName;
  @override
  String get email;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyCopyWith<_$_Company> get copyWith =>
      throw _privateConstructorUsedError;
}
