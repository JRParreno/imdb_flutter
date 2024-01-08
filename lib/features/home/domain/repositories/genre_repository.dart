import 'package:flutter_imdb/features/genres/data/models/genre_model.dart';

abstract class GenreRepository {
  Future<GenreModel> getGenres();
}
