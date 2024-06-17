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
    apiKey: 'AIzaSyAN7F_0Gf1n2JbnGKmtIOTIElmkgYMBIKg',
    appId: '1:287999801578:web:f356786f5902460141ff93',
    messagingSenderId: '287999801578',
    projectId: 'athar-pediatric',
    authDomain: 'athar-pediatric.firebaseapp.com',
    storageBucket: 'athar-pediatric.appspot.com',
    measurementId: 'G-FT4Z1J1BH5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPrhWQtWbZPKFrp9x59omEj3UPg2gmWkI',
    appId: '1:1019520823152:android:ba1e3fc4a028ff0d9969b5',
    messagingSenderId: '1019520823152',
    projectId: 'pediatric-pt',
    storageBucket: 'pediatric-pt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_hOoiSUdt9WdBMd-AUnLJjTYajuMMQVk',
    appId: '1:1019520823152:ios:1adbb6ac94dcdb129969b5',
    messagingSenderId: '1019520823152',
    projectId: 'pediatric-pt',
    storageBucket: 'pediatric-pt.appspot.com',
    iosBundleId: 'com.example.pediatricPt',
  );
}
