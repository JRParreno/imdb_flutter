import 'package:flutter_imdb/features/movies/data/models/imdb_filter_model.dart';
import 'package:flutter_imdb/features/movies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Movies> getPopularMovies(IMDBFilterModel imdbFilterModel);
}
