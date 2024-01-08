import 'dart:convert';

import 'package:intl/intl.dart';

class ReleaseDate {
  final ReleaseDateRange releaseDateRange;

  ReleaseDate(this.releaseDateRange);

  factory ReleaseDate.defaultReleaseDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final DateTime currentDate = DateTime.now();
    final endDate = '${currentDate.year - 1}-01-01';
    final releaseDateRange =
        ReleaseDateRange(start: formatter.format(currentDate), end: endDate);

    return ReleaseDate(releaseDateRange);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'releaseDateRange': releaseDateRange.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());
}

class ReleaseDateRange {
  final String start;
  final String end;

  ReleaseDateRange({
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'start': start});
    result.addAll({'end': end});

    return result;
  }

  String toJson() => json.encode(toMap());
}
