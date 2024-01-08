import 'dart:convert';

class Genres {
  final List<String> allGenderIds;

  Genres(this.allGenderIds);

  factory Genres.empty() {
    return Genres([]);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'allGenderIds': allGenderIds});

    return result;
  }

  String toJson() => json.encode(toMap());
}
