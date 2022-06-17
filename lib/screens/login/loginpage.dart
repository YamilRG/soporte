import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soporte/screens/HomePage.dart';
import 'package:soporte/screens/reusable_widgets/reusable_widgets.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  Widget _dialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Text("Fallo al Iniciar Sesión."),
      content: Text("Verifica que los datos sean correctos."),
      actions: <Widget>[
        Column(
          children: [
            RawMaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              fillColor: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cerrar",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }

  void _failed() {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
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
      if (e.code == "user-not-found") {}
    }
    return user;
  }

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://i1.wp.com/tubosylaminas.com/wp-content/uploads/2020/02/serv-corte-tubo.jpg?resize=600%2C600&ssl=1"),
              fit: BoxFit.fill,
              opacity: 0.8,
            )),
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.05, 20, 4.5),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    width: MediaQuery.of(context).size.width / 1,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        logoWidget("assets/images/logo.jpg", 240, 240),
                        SizedBox(height: 90),
                        reusableTextField2("Correo Electronico", Icons.email,
                            false, _emailTextController),
                        SizedBox(
                          height: 20,
                        ),
                        reusableTextField2("Contraseña", Icons.security, true,
                            _passwordTextController),
                        SizedBox(height: 197),
                        Container(
                            child: Container(
                          width: 170,
                          height: 40,
                          child: RawMaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            fillColor: Color.fromARGB(255, 255, 0, 0),
                            onPressed: () async {
                              User? user = await LoginWithPassEmail(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                  context: context);
                              print(user);
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            paginaprincipal()));
                              } else {
                                _failed();
                              }
                            },
                            child: Text(
                              "Iniciar Sesion",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                        SizedBox(height: 8),
                        Text("GAFI Servicios SA de CV"),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}

Image logoWidget(String imageName, double tamano1, double tamano2) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitHeight,
    width: tamano1,
    height: tamano2,
  );
}
