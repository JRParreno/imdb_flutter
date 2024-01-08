import 'dart:convert';

class Country {
  final List<String> anyPrimaryCountries;

  Country(this.anyPrimaryCountries);

  factory Country.defaultCountry() {
    return Country(['IN', 'US', 'PH']);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'anyPrimaryCountries': anyPrimaryCountries});

    return result;
  }

  String toJson() => json.encode(toMap());
}
