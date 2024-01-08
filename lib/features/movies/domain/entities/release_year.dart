import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_year.freezed.dart';
part 'release_year.g.dart';

@freezed
class ReleaseYear with _$ReleaseYear {
  const factory ReleaseYear({
    required int year,
    required dynamic endYear,
  }) = _ReleaseYear;

  factory ReleaseYear.fromJson(Map<String, dynamic> json) =>
      _$ReleaseYearFromJson(json);
}
