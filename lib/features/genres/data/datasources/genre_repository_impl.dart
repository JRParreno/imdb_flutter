import 'package:flutter_imdb/core/dio/dio_config.dart';
import 'package:flutter_imdb/features/genres/data/models/genre_model.dart';
import 'package:flutter_imdb/features/home/domain/repositories/genre_repository.dart';

class GenreRepositoryImpl implements GenreRepository {
  @override
  Future<GenreModel> getGenres() async {
    try {
      final results = await ApiInterceptor.apiInstance().get('/getGenres');
      return GenreModel.fromJson(results.data);
    } catch (e) {
      rethrow;
    }
  }
}
