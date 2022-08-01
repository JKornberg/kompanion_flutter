// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD8E3vXEwrn4TYs4GGhm2gD4aum6MDkVzA',
    appId: '1:621273456344:web:2beb7c1d3b5d32f98b01ad',
    messagingSenderId: '621273456344',
    projectId: 'kompanion-91880',
    authDomain: 'kompanion-91880.firebaseapp.com',
    storageBucket: 'kompanion-91880.appspot.com',
    measurementId: 'G-617Z5QRDLP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7IDFK2kA8TO_Gz_6nnr0Z1eMuqiU1Kyw',
    appId: '1:621273456344:android:d59d508a972088bd8b01ad',
    messagingSenderId: '621273456344',
    projectId: 'kompanion-91880',
    storageBucket: 'kompanion-91880.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCN781nWgpv1WQvwRaEdQ0JZuqscGxbYbc',
    appId: '1:621273456344:ios:3a26f2621ea6104c8b01ad',
    messagingSenderId: '621273456344',
    projectId: 'kompanion-91880',
    storageBucket: 'kompanion-91880.appspot.com',
    iosClientId: '621273456344-nmlf4m8c3i241erc9tiq16sqeobbomb5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatbotFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCN781nWgpv1WQvwRaEdQ0JZuqscGxbYbc',
    appId: '1:621273456344:ios:3a26f2621ea6104c8b01ad',
    messagingSenderId: '621273456344',
    projectId: 'kompanion-91880',
    storageBucket: 'kompanion-91880.appspot.com',
    iosClientId: '621273456344-nmlf4m8c3i241erc9tiq16sqeobbomb5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatbotFlutter',
  );
}