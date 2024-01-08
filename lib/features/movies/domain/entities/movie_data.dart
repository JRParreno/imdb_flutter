import 'package:flutter_imdb/core/page_info/page_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'titles.dart';

part 'movie_data.freezed.dart';
part 'movie_data.g.dart';

@freezed
class MovieData with _$MovieData {
  const factory MovieData({
    required PageInfo pageInfo,
    required List<ListElement> list,
  }) = _MovieData;

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);
}
