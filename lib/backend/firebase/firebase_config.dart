import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBsFZN1tTBYUfFuNwkCCqk-XHydGuEbFVs",
            authDomain: "tinderapps-57690.firebaseapp.com",
            projectId: "tinderapps-57690",
            storageBucket: "tinderapps-57690.appspot.com",
            messagingSenderId: "348788812567",
            appId: "1:348788812567:web:5184ef1a5feaed12f62552",
            measurementId: "G-NDCB99VJ5R"));
  } else {
    await Firebase.initializeApp();
  }
}
