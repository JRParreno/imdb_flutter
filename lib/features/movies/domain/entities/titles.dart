import 'package:freezed_annotation/freezed_annotation.dart';

import 'can_rate_title.dart';
import 'primary_image.dart';
import 'rating_summary.dart';
import 'release_year.dart';
import 'title_type.dart';

part 'titles.freezed.dart';
part 'titles.g.dart';

@freezed
class ListElement with _$ListElement {
  const factory ListElement({required Movie title}) = _ListElement;

  factory ListElement.fromJson(Map<String, dynamic> json) =>
      _$ListElementFromJson(json);
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String id,
    required bool isAdult,
    required CanRateTitle canRateTitle,
    required TitleText originalTitleText,
    required PrimaryImage primaryImage,
    required RatingsSummary ratingsSummary,
    required ReleaseYear releaseYear,
    required dynamic titleEpisode,
    required TitleText titleText,
    required TitleType titleType,
    required dynamic series,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

@freezed
class TitleText with _$TitleText {
  const factory TitleText({
    required String text,
  }) = _TitleText;

  factory TitleText.fromJson(Map<String, dynamic> json) =>
      _$TitleTextFromJson(json);
}
