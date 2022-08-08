import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soporte/screens/screens.dart';
import 'package:soporte/widgets/widgets.dart';

class Login_page_final_Screen extends StatefulWidget {
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

  Login_page_final_Screen({Key? key}) : super(key: key);

  @override
  State<Login_page_final_Screen> createState() =>
      _Login_page_final_ScreenState();
}

class _Login_page_final_ScreenState extends State<Login_page_final_Screen> {
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

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _emailTextController = TextEditingController();

  late StreamSubscription<User?> user;
  void initState() {
    super.initState();

    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('El usuario no esta logeado');
      } else
        (print('El usuario esta logeado'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 25, 40, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    logoWidget3("assets/logo1.png", 200, 200),
                    const SizedBox(height: 80),
                    reusableTextField2(
                        'Escribe tu correo',
                        "Correo Electronico",
                        Icons.email,
                        false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField2('Escribe tu contraseña', "Contraseña",
                        Icons.security, true, _passwordTextController),
                    const SizedBox(height: 180),
                    RawMaterialButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        fillColor: Colors.red,
                        onPressed: () async {
                          User? user =
                              await Login_page_final_Screen.LoginWithPassEmail(
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
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 0),
                      child: Text('Gafi'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
