import 'package:freezed_annotation/freezed_annotation.dart';

part 'primary_image.freezed.dart';
part 'primary_image.g.dart';

@freezed
class PrimaryImage with _$PrimaryImage {
  const factory PrimaryImage({
    required String id,
    required String imageUrl,
    required int imageWidth,
    required int imageHeight,
  }) = _PrimaryImage;

  factory PrimaryImage.fromJson(Map<String, dynamic> json) =>
      _$PrimaryImageFromJson(json);
}
