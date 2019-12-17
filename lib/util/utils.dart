import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {

  //colors
  static List<Color> appGradients = [
    Colors.blueGrey.shade800,
    Colors.black87,
  ];

  static List<Color> appGradients2 = [
    Colors.cyan.shade600,
    Colors.blue.shade900
  ];

  //randomcolor
  static final Random _random = new Random();

  /// Returns a random color.
  static Color next() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }

  static String formatTemperature({double temperature, int positions = 0, round = true}) {
    var unit = "°C";

    if (round) {
      temperature = temperature.floor().toDouble();
    }

    return "${temperature.toStringAsFixed(positions)} $unit";
  }

}