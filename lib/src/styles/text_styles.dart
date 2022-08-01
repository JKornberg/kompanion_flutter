import 'package:chatbot_flutter/src/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle get userMessage => const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get botMessage => const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get formLabel => const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get menuLabel => const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get title => const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get body => const TextStyle(
        fontSize: 14,
        color: Colors.white70,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get hyperlink => TextStyle(
        fontSize: 14,
        color: AppColors.accent,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get button => TextStyle(
        fontSize: 16,
        color: AppColors.dark,
        fontWeight: FontWeight.bold,
      );
}
