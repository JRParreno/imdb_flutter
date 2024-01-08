import 'dart:convert';

class UserRatings {
  final AggregateRatingRange aggregateRatingRange;
  final RatingsCountRange ratingsCountRange;

  UserRatings({
    required this.aggregateRatingRange,
    required this.ratingsCountRange,
  });

  factory UserRatings.defaultUserRatings() {
    final aggregateRatingRange = AggregateRatingRange(min: 6, max: 10);
    final ratingsCountRange = RatingsCountRange(1000);
    return UserRatings(
        aggregateRatingRange: aggregateRatingRange,
        ratingsCountRange: ratingsCountRange);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'aggregateRatingRange': aggregateRatingRange.toMap()});
    result.addAll({'ratingsCountRange': ratingsCountRange.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());
}

class AggregateRatingRange {
  final int max;
  final int min;

  AggregateRatingRange({
    required this.max,
    required this.min,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'max': max});
    result.addAll({'min': min});

    return result;
  }

  String toJson() => json.encode(toMap());
}

class RatingsCountRange {
  final int min;

  RatingsCountRange(this.min);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'min': min});

    return result;
  }

  String toJson() => json.encode(toMap());
}
