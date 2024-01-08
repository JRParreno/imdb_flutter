import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_summary.freezed.dart';
part 'rating_summary.g.dart';

@freezed
class RatingsSummary with _$RatingsSummary {
  const factory RatingsSummary({
    required double aggregateRating,
    required int voteCount,
    @Default(null) TopRanking? topRanking,
  }) = _RatingsSummary;

  factory RatingsSummary.fromJson(Map<String, dynamic> json) =>
      _$RatingsSummaryFromJson(json);
}

@freezed
class TopRanking with _$TopRanking {
  const factory TopRanking({required int rank}) = _TopRanking;

  factory TopRanking.fromJson(Map<String, dynamic> json) =>
      _$TopRankingFromJson(json);
}
