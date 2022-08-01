import 'dart:collection';

import 'package:chatbot_flutter/src/models/chat_message.dart';

class ChatHistory {
  ChatHistory({this.chat_context, this.history = const []});

  final String? chat_context;
  final List<ChatMessage> history;
  final Queue<ChatMessage> queue = Queue<ChatMessage>();

  add_to_queue() {
    queue.add(ChatMessage(text: "", fromUser: true));
  }

  addMessage(String text, bool fromUser) {
    //Check if queue is empty, if not add message to history
    if (queue.isNotEmpty) {
      queue.add(ChatMessage(fromUser: fromUser, text: text));
    } else {
      history.add(ChatMessage(fromUser: fromUser, text: text));
    }
  }

  getHistory() {
    int history_index = 0;
    int message_index = 0;
    List<String> result = [];

    while (history_index < history.length) {
      if (history[history_index].fromUser && message_index % 2 == 1) {
        String last = result.removeLast();
        result.add("$last. ${history[history_index].text}");
      } else {
        result.add(history[history_index].text);
        message_index++;
      }
      history_index++;
    }
    return result;
  }
}
