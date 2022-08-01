import 'package:chatbot_flutter/src/styles/base_styles.dart';
import 'package:chatbot_flutter/src/styles/colors.dart';
import 'package:chatbot_flutter/src/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FormTextField extends HookWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  const FormTextField(
      {Key? key,
      required this.label,
      this.obscureText = false,
      required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseStyles.formVerticalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            label,
            style: TextStyles.formLabel,
          ),
          Center(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.primary,
                hintText: 'Enter your $label',
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
