import 'package:chatbot_flutter/src/styles/colors.dart';
import 'package:chatbot_flutter/src/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseStyles {
  static const EdgeInsets headerPadding = EdgeInsets.symmetric(horizontal: 15);
  static const EdgeInsets messagePadding = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets betweenMessagePadding =
      EdgeInsets.symmetric(vertical: 15);
  static const EdgeInsets formVerticalPadding =
      EdgeInsets.symmetric(vertical: 15);
  static const int mediumScreenBreakpoint = 769;

  static List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(.5),
        offset: Offset(1, -2),
        blurRadius: 8,
      ),
    ];
  }

  static List<BoxShadow> get boxShadowPressed {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(.5),
        offset: Offset(1, 1),
        blurRadius: 1,
      ),
    ];
  }

  static ThemeData theme = ThemeData(
      primarySwatch: Colors.teal,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        color: AppColors.dark,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.accent,
        ),
      ),
      textTheme: TextTheme(
          bodyMedium: TextStyles.formLabel, bodyLarge: TextStyles.menuLabel));
}
