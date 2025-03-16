import 'package:flutter/material.dart';

extension HexColorExtension on String {
  Color toColor() {
    String hexColor = replaceAll("#", "").toUpperCase(); // Remove #

    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Add full opacity if missing
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}
