/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soporte/screens/home/HomePage.dart';
import 'package:soporte/widgets/reusable_widgets.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  Widget _dialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: const Text("Fallo al Iniciar Sesión."),
      content: const Text("Comprueba tus credenciales o verifica tu conexión."),
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
              child: const Text(
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
      if (e.code == "user-not-found") {
        print("Usuario no encontrado");
      }
    }
    return user;
  }

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  //  Build ---------------------------->

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://i1.wp.com/tubosylaminas.com/wp-content/uploads/2020/02/serv-corte-tubo.jpg?resize=600%2C600&ssl=1"),
              fit: BoxFit.cover,
              opacity: 0.8,
            )),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 4),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      width: MediaQuery.of(context).size.width / 1,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 50),
                          logoWidget3("assets/images/logo.jpg", 240, 240),
                          const SizedBox(height: 70),
                          reusableTextField2("Correo Electronico", Icons.email,
                              false, _emailTextController),
                          const SizedBox(
                            height: 20,
                          ),
                          reusableTextField2("Contraseña", Icons.security, true,
                              _passwordTextController),
                          const SizedBox(height: 190),
                          Container(
                              child: Container(
                            width: 170,
                            height: 40,
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              fillColor: const Color.fromARGB(255, 255, 0, 0),
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
                                              const HomeScreen()));
                                } else {
                                  _failed();
                                }
                              },
                              child: const Text(
                                "Iniciar Sesion",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                          const SizedBox(height: 8),
                          const Text("GAFI Servicios SA de CV"),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}
*/