import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_model.freezed.dart';
part 'genre_model.g.dart';

@freezed
class GenreModel with _$GenreModel {
  const factory GenreModel({
    required bool status,
    required String message,
    required GenresData data,
    // ignore: invalid_annotation_target
    @Default(0) @JsonKey(name: 'timestamp') int timeStamp,
  }) = _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  factory GenreModel.empty() {
    return const GenreModel(
      message: '',
      status: false,
      timeStamp: -1,
      data: GenresData(
        allGenres: [],
        popularGenres: [],
      ),
    );
  }
}

@freezed
class GenresData with _$GenresData {
  const factory GenresData({
    // ignore: invalid_annotation_target
    @Default([]) @JsonKey(name: 'all_genres') List<String> allGenres,
    // ignore: invalid_annotation_target
    @Default([]) @JsonKey(name: 'popular_genres') List<String> popularGenres,
  }) = _GenresData;

  factory GenresData.fromJson(Map<String, dynamic> json) =>
      _$GenresDataFromJson(json);
}
