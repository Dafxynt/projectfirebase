// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDIFldJWqO_wmm43tQpxYOecUyJPg4qM6g',
    appId: '1:157874304715:web:0a208aa2a914a450f70d4e',
    messagingSenderId: '157874304715',
    projectId: 'flutter-project-bb633',
    authDomain: 'flutter-project-bb633.firebaseapp.com',
    storageBucket: 'flutter-project-bb633.firebasestorage.app',
    measurementId: 'G-GZM5F7KKMY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAirEs3kRJis73-oINpsYRY67Ri3AaLaSQ',
    appId: '1:157874304715:android:8a2b507724bbb1c5f70d4e',
    messagingSenderId: '157874304715',
    projectId: 'flutter-project-bb633',
    storageBucket: 'flutter-project-bb633.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBozRmDCmjAMuThJFntCUsnkFk55ahnuQU',
    appId: '1:157874304715:ios:2902c4052bcfe8c2f70d4e',
    messagingSenderId: '157874304715',
    projectId: 'flutter-project-bb633',
    storageBucket: 'flutter-project-bb633.firebasestorage.app',
    iosBundleId: 'com.example.flutterGoogleSignin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBozRmDCmjAMuThJFntCUsnkFk55ahnuQU',
    appId: '1:157874304715:ios:2902c4052bcfe8c2f70d4e',
    messagingSenderId: '157874304715',
    projectId: 'flutter-project-bb633',
    storageBucket: 'flutter-project-bb633.firebasestorage.app',
    iosBundleId: 'com.example.flutterGoogleSignin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIFldJWqO_wmm43tQpxYOecUyJPg4qM6g',
    appId: '1:157874304715:web:e7b0827fb014ec7bf70d4e',
    messagingSenderId: '157874304715',
    projectId: 'flutter-project-bb633',
    authDomain: 'flutter-project-bb633.firebaseapp.com',
    storageBucket: 'flutter-project-bb633.firebasestorage.app',
    measurementId: 'G-ZCR7C3YR56',
  );
}