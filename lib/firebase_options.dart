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
    apiKey: 'AIzaSyCDy65aUgquY83ylFsBu9tvAaET_tcX7vU',
    appId: '1:621702210816:web:b61b7eb35470fe4a307fe5',
    messagingSenderId: '621702210816',
    projectId: 'money-m-de59d',
    authDomain: 'money-m-de59d.firebaseapp.com',
    storageBucket: 'money-m-de59d.appspot.com',
    measurementId: 'G-RLV6CGWQN7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdYR0HYPiIJwOaXkWHO_q5YDCRU0oNpMw',
    appId: '1:621702210816:android:23af597d637e6134307fe5',
    messagingSenderId: '621702210816',
    projectId: 'money-m-de59d',
    storageBucket: 'money-m-de59d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO34N4I0A4fs0PagwlPC6s0uGp29QfJPg',
    appId: '1:621702210816:ios:2859f8823bd59efc307fe5',
    messagingSenderId: '621702210816',
    projectId: 'money-m-de59d',
    storageBucket: 'money-m-de59d.appspot.com',
    iosBundleId: 'com.example.moneymanagementapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDO34N4I0A4fs0PagwlPC6s0uGp29QfJPg',
    appId: '1:621702210816:ios:05085cfca4d5b405307fe5',
    messagingSenderId: '621702210816',
    projectId: 'money-m-de59d',
    storageBucket: 'money-m-de59d.appspot.com',
    iosBundleId: 'com.example.moneymanagementapp.RunnerTests',
  );
}