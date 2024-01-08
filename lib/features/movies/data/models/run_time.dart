import 'dart:convert';

class Runtime {
  final RuntimeRangeMinutes runtimeRangeMinutes;

  Runtime(this.runtimeRangeMinutes);

  factory Runtime.defaultRuntime() {
    final runtimeRangeMinutes = RuntimeRangeMinutes(min: 0, max: 120);
    return Runtime(runtimeRangeMinutes);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'runtimeRangeMinutes': runtimeRangeMinutes.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());
}

class RuntimeRangeMinutes {
  final int min;
  final int max;

  RuntimeRangeMinutes({
    required this.min,
    required this.max,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'min': min});
    result.addAll({'max': max});

    return result;
  }

  String toJson() => json.encode(toMap());
}
