// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCZjwXQTlu5N2Ol8uUTzbo7RcZaDhUxvi8',
    appId: '1:616679695249:web:588af240080d1891807030',
    messagingSenderId: '616679695249',
    projectId: 'alerta-queimadas',
    authDomain: 'alerta-queimadas.firebaseapp.com',
    storageBucket: 'alerta-queimadas.appspot.com',
    measurementId: 'G-N6SYHFH60F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1TK41iontbaCHUoCgycacLWtBnjd3qYo',
    appId: '1:616679695249:android:75ca82b06ac11d93807030',
    messagingSenderId: '616679695249',
    projectId: 'alerta-queimadas',
    storageBucket: 'alerta-queimadas.appspot.com',
  );
}
