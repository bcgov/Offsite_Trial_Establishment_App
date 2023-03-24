import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required double? latitude,
    required double? longitude,
    required int? elevation,
  }) = _Location;

  factory Location.create() => const Location(
        latitude: null,
        longitude: null,
        elevation: null,
      );

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
