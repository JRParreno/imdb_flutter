import 'package:freezed_annotation/freezed_annotation.dart';

part 'can_rate_title.freezed.dart';
part 'can_rate_title.g.dart';

@freezed
class CanRateTitle with _$CanRateTitle {
  const factory CanRateTitle({
    required bool isRatable,
  }) = _CanRateTitle;

  factory CanRateTitle.fromJson(Map<String, dynamic> json) =>
      _$CanRateTitleFromJson(json);
}
