// styles.dart
import 'package:flutter/material.dart';

class AppGradients {
  static BoxDecoration get monochromaticGreenGradient {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.5, 1.0],
        colors: [
          Color(0xFF455947), // Dark green (100% opacity)
          Color(0xFF455947).withOpacity(0.8), // 80% opacity
          Color(0xFF455947).withOpacity(0.5), // 50% opacity
        ],
      ),
    );
  }
}
