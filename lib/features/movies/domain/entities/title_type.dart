import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

part 'title_type.freezed.dart';
part 'title_type.g.dart';

@freezed
class TitleType with _$TitleType {
  const factory TitleType({
    required String id,
    required String text,
    required DisplayableProperty displayableProperty,
    required List<Category> categories,
    required bool canHaveEpisodes,
    required bool isSeries,
    required bool isEpisode,
  }) = _TitleType;

  factory TitleType.fromJson(Map<String, dynamic> json) =>
      _$TitleTypeFromJson(json);
}

@freezed
class DisplayableProperty with _$DisplayableProperty {
  const factory DisplayableProperty({
    required Value value,
  }) = _DisplayableProperty;

  factory DisplayableProperty.fromJson(Map<String, dynamic> json) =>
      _$DisplayablePropertyFromJson(json);
}

@freezed
class Value with _$Value {
  const factory Value({
    required String plainText,
  }) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}
