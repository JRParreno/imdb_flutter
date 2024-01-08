import 'package:flutter_imdb/core/dio/dio_config.dart';
import 'package:flutter_imdb/features/movies/data/models/imdb_filter_model.dart';
import 'package:flutter_imdb/features/movies/domain/entities/movie.dart';
import 'package:flutter_imdb/features/tv_shows/domain/repositories/tv_show_repository.dart';

class TVShowRepositoryImpl extends TVShowRepository {
  @override
  Future<Movies> getPopularTVShows(IMDBFilterModel imdbFilterModel) async {
    try {
      final data = {"data": imdbFilterModel.toMap()};

      final results = await ApiInterceptor.apiInstance()
          .post('/getPopularTVShows', data: data);
      return Movies.fromJson(results.data);
    } catch (e) {
      rethrow;
    }
  }
}
