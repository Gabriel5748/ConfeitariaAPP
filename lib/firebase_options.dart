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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBLCksVEpgQ-GnTLVSkdKeLy8nnVYgLnkE',
    appId: '1:1050659662760:web:b42fc63c195674f4c88b9d',
    messagingSenderId: '1050659662760',
    projectId: 'confeitariaapp-1e193',
    authDomain: 'confeitariaapp-1e193.firebaseapp.com',
    storageBucket: 'confeitariaapp-1e193.appspot.com',
    measurementId: 'G-SXRJWM39B1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqnORLTGcORMSgrdBYFpIX8K34HovHOmk',
    appId: '1:1050659662760:android:8a5b19c5cba3160cc88b9d',
    messagingSenderId: '1050659662760',
    projectId: 'confeitariaapp-1e193',
    storageBucket: 'confeitariaapp-1e193.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDszcbASx8RAxqcG4VQAkEylJsfzk0JnF4',
    appId: '1:1050659662760:ios:ccf4c27bdae17bd9c88b9d',
    messagingSenderId: '1050659662760',
    projectId: 'confeitariaapp-1e193',
    storageBucket: 'confeitariaapp-1e193.appspot.com',
    iosBundleId: 'com.example.appRestaurante',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBLCksVEpgQ-GnTLVSkdKeLy8nnVYgLnkE',
    appId: '1:1050659662760:web:caf81bc94e4835f7c88b9d',
    messagingSenderId: '1050659662760',
    projectId: 'confeitariaapp-1e193',
    authDomain: 'confeitariaapp-1e193.firebaseapp.com',
    storageBucket: 'confeitariaapp-1e193.appspot.com',
    measurementId: 'G-EZZBTNF69S',
  );
}