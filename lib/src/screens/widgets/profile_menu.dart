import 'package:chatbot_flutter/src/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileMenu extends StatelessWidget {
  final User user;
  const ProfileMenu({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          user.displayName ?? user.email ?? user.uid,
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 0,
          enabled: false,
          child: SelectableText(
            user.displayName ?? user.email ?? user.uid,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(value: 1, child: Text("Profile")),
        const PopupMenuItem(value: 2, child: Text("Sign Out")),
      ],
    );
  }
}
