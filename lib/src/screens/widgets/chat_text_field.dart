import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatTextField extends HookWidget {
  final void Function(String) onSubmitted;
  final TextEditingController controller;
  const ChatTextField(
      {Key? key, required this.onSubmitted, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.text,
      child: TextField(
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: "Type a message",
        ),
        controller: controller,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
