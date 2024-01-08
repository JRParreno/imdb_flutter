// ignore: constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_data.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class Movies with _$Movies {
  const factory Movies({
    required bool status,
    required String message,
    required MovieData data,
  }) = _Movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}
