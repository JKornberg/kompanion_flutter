import 'dart:convert';
import 'dart:io';
import 'package:chatbot_flutter/src/controllers/auth_controller.dart';
import 'package:chatbot_flutter/src/models/chat_history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:chatbot_flutter/src/models/chat_message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatHistoryNotifierProvider =
    StateNotifierProvider<ChatHistoryNotifier, ChatHistory>((ref) {
  return ChatHistoryNotifier(ref.read);
});

class ChatHistoryNotifier extends StateNotifier<ChatHistory> {
  final Function<T>(ProviderBase<T>) _read;
  ChatHistoryNotifier(this._read) : super(ChatHistory());

  addUserMessage(String text) {
    if (text.isEmpty) {
      return;
    }
    addMessage(text, true);
    requestResponse(text);
  }

  addMessage(String text, bool fromUser) {
    if (text.isEmpty) {
      return;
    }
    List<String> newList = [...state.history, text];
  }
}
