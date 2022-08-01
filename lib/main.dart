import 'package:chatbot_flutter/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD8E3vXEwrn4TYs4GGhm2gD4aum6MDkVzA",
          authDomain: "kompanion-91880.firebaseapp.com",
          projectId: "kompanion-91880",
          storageBucket: "kompanion-91880.appspot.com",
          messagingSenderId: "621273456344",
          appId: "1:621273456344:web:2beb7c1d3b5d32f98b01ad",
          measurementId: "G-617Z5QRDLP"));

  runApp(ProviderScope(child: App()));
}
