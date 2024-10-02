import 'package:flutter/material.dart';

extension DoubleExt on double {
  SizedBox get sizeWidth => SizedBox(
        width: toDouble(),
      );
  SizedBox get sizeHeight => SizedBox(
        height: toDouble(),
      );

  String get format {
    String string = toStringAsFixed(4);
    while ((string[string.length - 1] == '.') ||
        ((string[string.length - 1] == '0'))) {
      string = string.substring(0, string.length - 1);
    }
    return string;
  }
}

extension IntExt on double {
  SizedBox get sizeWidth => SizedBox(
        width: this,
      );
  SizedBox get sizeHeight => SizedBox(
        height: this,
      );
}
