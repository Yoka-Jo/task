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
    apiKey: 'AIzaSyB4Sfg_aMchEzb4zJtaNb0Xww267zDJH3I',
    appId: '1:598775888757:web:7651dd0b84ad6cda79313c',
    messagingSenderId: '598775888757',
    projectId: 'task-57271',
    authDomain: 'task-57271.firebaseapp.com',
    storageBucket: 'task-57271.appspot.com',
    measurementId: 'G-4LMTSE93TY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABxQ19oJtrWPaYywBmfh6B0lLXM5-RdAo',
    appId: '1:598775888757:android:a88b73093088f4cb79313c',
    messagingSenderId: '598775888757',
    projectId: 'task-57271',
    storageBucket: 'task-57271.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLyz7rC91mq7Na1byXMyr-JEFfARpfNco',
    appId: '1:598775888757:ios:2fc421bd9e8a801b79313c',
    messagingSenderId: '598775888757',
    projectId: 'task-57271',
    storageBucket: 'task-57271.appspot.com',
    iosClientId: '598775888757-ct5kath6ioorm9f6raamvmqi65eugb7q.apps.googleusercontent.com',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLyz7rC91mq7Na1byXMyr-JEFfARpfNco',
    appId: '1:598775888757:ios:2fc421bd9e8a801b79313c',
    messagingSenderId: '598775888757',
    projectId: 'task-57271',
    storageBucket: 'task-57271.appspot.com',
    iosClientId: '598775888757-ct5kath6ioorm9f6raamvmqi65eugb7q.apps.googleusercontent.com',
    iosBundleId: 'com.example.task',
  );
}
