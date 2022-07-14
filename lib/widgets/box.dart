/*import 'package:flutter/material.dart';
import 'package:soporte/screens/prueba.dart';
import 'package:soporte/widgets/widgets.dart';

class boxScreen extends StatelessWidget {
  const boxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  print("Hola");
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const pruebaScreen()));
                },
                child: Container(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 2, 50, 2),
                    child: logoWidget("assets/images/logoXme.png", 300, 80),
                  )),
                  width: 320,
                  height: 110,
                ),
                elevation: 4,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                splashColor: const Color.fromARGB(255, 252, 0, 0),
              ),
              /*RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  print("Hola");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Prueba()));
                },
                child: Container(
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 20),
                    child: logoWidget("assets/images/desktop.png", 80, 80),
                  )),
                  width: 130,
                  height: 125,
                ),
                elevation: 20.0,
                fillColor: Colors.red,
              ),*/
            )
          ],
        ),
      ),
    );
  }
}
*/