import 'package:flutter_imdb/core/dio/dio_config.dart';
import 'package:flutter_imdb/features/fan_favorites/domain/repositories/fan_favorite_repository.dart';
import 'package:flutter_imdb/features/movies/domain/entities/movie.dart';

class FanFavoriteRepositoryImpl extends FanFavoriteRepository {
  @override
  Future<Movies> getFanFavorites(String country) async {
    try {
      final results = await ApiInterceptor.apiInstance()
          .get('/getFanFavorites', queryParameters: {'country': country});
      return Movies.fromJson(results.data);
    } catch (e) {
      rethrow;
    }
  }
}
