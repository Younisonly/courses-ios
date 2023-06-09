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
    apiKey: 'AIzaSyADvqHxQ_TEEPD_dskhjmrzyy09nfqLikk',
    appId: '1:366987920726:web:2343e3c33b971c26c2c2f7',
    messagingSenderId: '366987920726',
    projectId: 'my-courses-9ed76',
    authDomain: 'my-courses-9ed76.firebaseapp.com',
    storageBucket: 'my-courses-9ed76.appspot.com',
    measurementId: 'G-3R6FYPB7X6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_XP-a6BK_9-L8G68L0EmvzQn9YPvu-Fw',
    appId: '1:366987920726:android:581beb5e77c2540cc2c2f7',
    messagingSenderId: '366987920726',
    projectId: 'my-courses-9ed76',
    storageBucket: 'my-courses-9ed76.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDht9fRWU4lecPOKuN-T3srhxDPlV-8iCg',
    appId: '1:366987920726:ios:8309643d96b709f9c2c2f7',
    messagingSenderId: '366987920726',
    projectId: 'my-courses-9ed76',
    storageBucket: 'my-courses-9ed76.appspot.com',
    iosClientId: '366987920726-24u96gl564thkdc8o6d7kt0ft1rc7kpc.apps.googleusercontent.com',
    iosBundleId: 'com.example.courses',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDht9fRWU4lecPOKuN-T3srhxDPlV-8iCg',
    appId: '1:366987920726:ios:8309643d96b709f9c2c2f7',
    messagingSenderId: '366987920726',
    projectId: 'my-courses-9ed76',
    storageBucket: 'my-courses-9ed76.appspot.com',
    iosClientId: '366987920726-24u96gl564thkdc8o6d7kt0ft1rc7kpc.apps.googleusercontent.com',
    iosBundleId: 'com.example.courses',
  );
}
