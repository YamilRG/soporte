import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soporte/screens/home/HomePage.dart';
import 'package:soporte/widgets/widgets.dart';

class Login_page_final_Screen extends StatelessWidget {
  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (contex) {
          return CupertinoAlertDialog(
            title: const Text('Fallo al Iniciar Sesión.'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                    'Verifica que tus datos sean correctos o revisa tu conexion a internet.'),
                SizedBox(height: 10),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:
                      const Text('ok', style: TextStyle(color: Colors.indigo))),
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (contex) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            title: const Text('Fallo al Iniciar Sesión.'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                    'Verifica que tus datos sean correctos o revisa tu conexion a internet.'),
                SizedBox(height: 10),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:
                      const Text('ok', style: TextStyle(color: Colors.indigo))),
            ],
          );
        });
  }

  static Future<User?> LoginWithPassEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Usuario no encontrado");
      }
    }
    return user;
  }

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  Login_page_final_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i1.wp.com/tubosylaminas.com/wp-content/uploads/2020/02/serv-corte-tubo.jpg?resize=600%2C600&ssl=1'),
                  fit: BoxFit.cover,
                  opacity: 0.8)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          logoWidget3("assets/images/logo.jpg", 200, 200),
                          const SizedBox(height: 60),
                          reusableTextField2(
                              'Escribe tu correo',
                              "Correo Electronico",
                              Icons.email,
                              false,
                              _emailTextController),
                          const SizedBox(
                            height: 30,
                          ),
                          reusableTextField2(
                              'Escribe tu contraseña',
                              "Contraseña",
                              Icons.security,
                              true,
                              _passwordTextController),
                          const SizedBox(height: 200),
                          RawMaterialButton(
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              fillColor: Colors.red,
                              onPressed: () async {
                                User? user = await LoginWithPassEmail(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                    context: context);
                                print(user);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Home_Screen()));
                                } else {
                                  Platform.isAndroid
                                      ? displayDialogAndroid(context)
                                      : displayDialogIOS(context);
                                }
                              }),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
