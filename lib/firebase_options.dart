
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDO_T7cIKs0fnxGi0jK2iH8w0QZnxH0a0g',
    appId: '1:1094873982336:android:3cb6d6148c2010071ecd65',
    messagingSenderId: '1094873982336',
    projectId: 'fair-pro-e0865',
    storageBucket: 'fair-pro-e0865.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDd5Woi17nS6y3NkJkzv8G3KZyW119uXa0',
    appId: '1:1094873982336:ios:27d72bcf0593142a1ecd65',
    messagingSenderId: '1094873982336',
    projectId: 'fair-pro-e0865',
    storageBucket: 'fair-pro-e0865.firebasestorage.app',
    iosClientId: '1094873982336-c5rkpvtp36g1q0mu56qavfgkpga41sog.apps.googleusercontent.com',
    iosBundleId: 'com.example.fairPro',
  );

}