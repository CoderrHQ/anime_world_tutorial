import 'package:flutter/foundation.dart' show immutable;

@immutable
class Picture {
  final String medium;
  final String large;

  const Picture({
    required this.medium,
    required this.large,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      medium: json['medium'],
      large: json['large'],
    );
  }
}
