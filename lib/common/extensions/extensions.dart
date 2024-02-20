import 'dart:math';

import 'package:flutter/material.dart';

extension ConvertToMinute on int {
  String toMinute() {
    int inMinute = this ~/ 60;
    return '$inMinute mins';
  }
}

extension Capitalize on String {
  String capitalize() {
    String firstCharacter = characters.first.toUpperCase();
    String remaining = substring(1);

    return firstCharacter + remaining;
  }
}

extension PickRandomItem<T> on List<T> {
  T randomItem() {
    int max = length;
    int randomNumber = Random().nextInt(max);

    return this[randomNumber];
  }
}
