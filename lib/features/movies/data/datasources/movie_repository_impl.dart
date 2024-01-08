import 'package:flutter_imdb/core/dio/dio_config.dart';
import 'package:flutter_imdb/features/movies/data/models/imdb_filter_model.dart';
import 'package:flutter_imdb/features/movies/domain/entities/movies.dart';
import 'package:flutter_imdb/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Movies> getPopularMovies(IMDBFilterModel imdbFilterModel) async {
    try {
      final data = {"data": imdbFilterModel.toMap()};

      final results = await ApiInterceptor.apiInstance()
          .post('/getPopularMovies', data: data);
      return Movies.fromJson(results.data);
    } catch (e) {
      rethrow;
    }
  }
}
