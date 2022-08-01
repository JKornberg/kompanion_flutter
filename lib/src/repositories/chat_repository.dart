import 'dart:convert';

import 'package:chatbot_flutter/src/controllers/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class ChatRepository {
  final Function<T>(ProviderBase<T>) _read;
  ChatRepository(this._read);

  Future<String?> requestResponse(String text) async {
    try {
      final auth = _read(firebaseAuthProvider);
      final currentUser = auth.currentUser;
      if (currentUser == null) {
        return null;
      }
      String idToken = await currentUser.getIdToken(true);
      print("Sending request to server...");
      var res = await http.post(Uri.parse("http://localhost:3000/chat"), body: {
        "text": text,
      }, headers: {
        "AuthToken": idToken,
      });
      var json = jsonDecode(res.body);
      return (json['text']);
      // addMessage(
      //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      //     false);
    } catch (e) {
      print(e);
    }
  }
}
