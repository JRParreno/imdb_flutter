import 'package:flutter_imdb/features/movies/domain/entities/movie.dart';

abstract class FanFavoriteRepository {
  Future<Movies> getFanFavorites(String country);
}
