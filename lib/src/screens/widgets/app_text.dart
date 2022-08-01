import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(this.text, {this.style, Key? key}) : super(key: key);
  final TextStyle? style;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SelectableText(text, style: style);
  }
}
