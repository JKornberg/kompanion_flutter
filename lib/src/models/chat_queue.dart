import 'dart:collection';

import 'package:chatbot_flutter/src/models/chat_message.dart';

class ChatQueue {
  final queue = Queue<ChatMessage>();

  ChatQueue();

  addMessage(String text, bool fromUser) {
    queue.add(ChatMessage(fromUser: fromUser, text: text));
  }
}
