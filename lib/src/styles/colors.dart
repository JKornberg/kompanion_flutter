import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get background => const Color(0xFF373f51);
  static Color get accent => Colors.teal;
  static Color get highlight => Colors.teal[100]!;
  static Color get primary => const Color(0xFFd8dbe2);
  static Color get secondary => const Color(0xFFa9bcd0);
  static Color get dark => const Color(0xFF1b1b1e);
}
