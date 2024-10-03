import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQgohm3PospL9iJpVnZDZGore9VaGAxMk',
    appId: '1:674156941066:android:afceeec340987818eff4f3',
    messagingSenderId: '674156941066',
    projectId: 'personalnotes-60373',
    storageBucket: 'personalnotes-60373.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQgohm3PospL9iJpVnZDZGore9VaGAxMk',
    appId: '1:674156941066:ios:690138cb2f0ce4d9eff4f3',
    messagingSenderId: '674156941066',
    projectId: 'personalnotes-60373',
    storageBucket: 'personalnotes-60373.appspot.com',
    iosBundleId: 'com.notes.app',
  );

 static const FirebaseOptions macos = FirebaseOptions(
   apiKey: 'AIzaSyCQgohm3PospL9iJpVnZDZGore9VaGAxMk',
   appId: '1:674156941066:ios:690138cb2f0ce4d9eff4f3',
   messagingSenderId: '674156941066',
   projectId: 'personalnotes-60373',
   storageBucket: 'personalnotes-60373.appspot.com',
   iosBundleId: 'com.notes.app',
  );
}