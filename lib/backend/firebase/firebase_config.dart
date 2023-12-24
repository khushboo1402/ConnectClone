import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDUIBRpfzwZhdDrINziHsNa4b01fUx5R4E",
            authDomain: "flutter-heart-6nrj5i.firebaseapp.com",
            projectId: "flutter-heart-6nrj5i",
            storageBucket: "flutter-heart-6nrj5i.appspot.com",
            messagingSenderId: "1010780327002",
            appId: "1:1010780327002:web:1db636e4602f30d2c09c63"));
  } else {
    await Firebase.initializeApp();
  }
}
