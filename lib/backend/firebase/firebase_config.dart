import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCqtcz71STCfBWmVtYqRsYj2lFy_MB7lXw",
            authDomain: "shopapp-f7ade.firebaseapp.com",
            projectId: "shopapp-f7ade",
            storageBucket: "shopapp-f7ade.appspot.com",
            messagingSenderId: "833133110709",
            appId: "1:833133110709:web:83fe0f075585526ed125fc",
            measurementId: "G-8YS260GRFP"));
  } else {
    await Firebase.initializeApp();
  }
}
