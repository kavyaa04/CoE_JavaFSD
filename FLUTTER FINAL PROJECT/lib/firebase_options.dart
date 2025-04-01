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
    apiKey: 'AIzaSyCkKEKi56-gofdKZaw5Njv85I5BjCGVuZ8',
    appId: '1:981384918259:web:7cc531ee34fa1ce9f13386',
    messagingSenderId: '981384918259',
    projectId: 'studyproductive-330d5',
    authDomain: 'studyproductive-330d5.firebaseapp.com',
    storageBucket: 'studyproductive-330d5.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbnl0bs5yqzH4zx_EgSKyxxlwY5cQNC3U',
    appId: '1:981384918259:android:03897f52b3c29163f13386',
    messagingSenderId: '981384918259',
    projectId: 'studyproductive-330d5',
    storageBucket: 'studyproductive-330d5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgu5C52WRhMWz09XlJQR-mHgnAaNEjHmU',
    appId: '1:981384918259:ios:c1816fff534c1102f13386',
    messagingSenderId: '981384918259',
    projectId: 'studyproductive-330d5',
    storageBucket: 'studyproductive-330d5.firebasestorage.app',
    iosBundleId: 'com.example.finaltask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgu5C52WRhMWz09XlJQR-mHgnAaNEjHmU',
    appId: '1:981384918259:ios:c1816fff534c1102f13386',
    messagingSenderId: '981384918259',
    projectId: 'studyproductive-330d5',
    storageBucket: 'studyproductive-330d5.firebasestorage.app',
    iosBundleId: 'com.example.finaltask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCkKEKi56-gofdKZaw5Njv85I5BjCGVuZ8',
    appId: '1:981384918259:web:fbc2ee7a0c3481ebf13386',
    messagingSenderId: '981384918259',
    projectId: 'studyproductive-330d5',
    authDomain: 'studyproductive-330d5.firebaseapp.com',
    storageBucket: 'studyproductive-330d5.firebasestorage.app',
  );
}
