import 'package:flutter/material.dart';

@immutable
class TextStyles {
  // Small text
  static final smallText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(.9),
  );

  // Medium Text
  static const mediumText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Large Text
  static const largeText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const titleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  const TextStyles._();
}
