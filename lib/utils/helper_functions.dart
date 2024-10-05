import 'dart:math';
import 'package:flutter/material.dart';


class HelperFunctions{

  Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255, // Alpha value (opacity)
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }

  Color generateMaterialColor() {
    // List of some Material colors
    List<Color> materialColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.brown,
      Colors.cyan,
    ];

    Random random = Random();
    return materialColors[random.nextInt(materialColors.length)];
  }

}