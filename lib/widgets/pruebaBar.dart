import 'package:flutter/material.dart';
import 'package:soporte/widgets/widgets.dart';

class pruebaBar1Screen extends StatelessWidget {
  const pruebaBar1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(
          height: 70,
          child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
              iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 0, 0, 0), size: 32),
              title: Row(children: [
                SizedBox(
                  width: 205,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: logoWidget2("assets/images/logoXme.png", 45, 55)),
                ),
              ])),
        )
      ],
    ));
  }
}
