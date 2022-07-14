import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soporte/screens/screens.dart';

class Firebase_screen extends StatefulWidget {
  const Firebase_screen({Key? key}) : super(key: key);

  @override
  State<Firebase_screen> createState() => _Firebase_screenState();
}

class _Firebase_screenState extends State<Firebase_screen> {
  Future<FirebaseApp> _initializerFirebaseApp() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: _initializerFirebaseApp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Login_page_final_Screen();
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
