import 'dart:convert';

import 'package:flutter_imdb/features/movies/data/models/user_ratings.dart';

import 'country.dart';
import 'genres.dart';
import 'release_date.dart';
import 'run_time.dart';

class IMDBFilterModel {
  final Country country;
  final ReleaseDate releaseDate;
  final Genres genre;
  final Runtime runtime;
  final UserRatings userRatings;
  final int limit;

  IMDBFilterModel({
    required this.country,
    required this.releaseDate,
    required this.genre,
    required this.runtime,
    required this.userRatings,
    this.limit = 100,
  });

  @override
  String toString() {
    return 'IMDBFilterModel(country: $country, releaseDate: $releaseDate, genre: $genre, runtime: $runtime, userRatings: $userRatings, limit: $limit)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'country': country.toMap()});
    result.addAll({'releaseDate': releaseDate.toMap()});
    result.addAll({'genre': genre.toMap()});
    result.addAll({'runtime': runtime.toMap()});
    result.addAll({'userRatings': userRatings.toMap()});
    result.addAll({'limit': limit});

    return result;
  }

  String toJson() => json.encode(toMap());
}
