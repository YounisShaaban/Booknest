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
    apiKey: 'AIzaSyDZPUindtStZ_wneQxfLfEM5UXYcZF4IDU',
    appId: '1:114036710900:web:ae17811c8d1eb2090aada1',
    messagingSenderId: '114036710900',
    projectId: 'book-me-auth',
    authDomain: 'book-me-auth.firebaseapp.com',
    storageBucket: 'book-me-auth.appspot.com',
    measurementId: 'G-2P62PTSBP0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBBGrRVC71vPSmF1yxeWSGAJeMI5zMp4k',
    appId: '1:114036710900:android:7f6622480ed0c6a10aada1',
    messagingSenderId: '114036710900',
    projectId: 'book-me-auth',
    storageBucket: 'book-me-auth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWrkDtaNKcIvgsjQijpQlDU4fiwm-fnVw',
    appId: '1:114036710900:ios:51a6640e9b5ffda60aada1',
    messagingSenderId: '114036710900',
    projectId: 'book-me-auth',
    storageBucket: 'book-me-auth.appspot.com',
    iosBundleId: 'com.example.bookMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWrkDtaNKcIvgsjQijpQlDU4fiwm-fnVw',
    appId: '1:114036710900:ios:9d586c91094389670aada1',
    messagingSenderId: '114036710900',
    projectId: 'book-me-auth',
    storageBucket: 'book-me-auth.appspot.com',
    iosBundleId: 'com.example.bookMe.RunnerTests',
  );
}