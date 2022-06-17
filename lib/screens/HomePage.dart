import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:soporte/screens/prueba.dart';
import 'package:soporte/screens/reusable_widgets/reusable_widgets.dart';

class paginaprincipal extends StatefulWidget {
  paginaprincipal({Key? key}) : super(key: key);

  @override
  State<paginaprincipal> createState() => _paginaprincipalState();
}

class _paginaprincipalState extends State<paginaprincipal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      drawer:
          Container(width: 200, child: Drawer(backgroundColor: Colors.black)),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 28, 0, 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      child: AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        iconTheme: IconThemeData(
                            color: Color.fromARGB(255, 0, 0, 0), size: 30),
                        title: Row(children: <Widget>[
                          Container(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                                  child: Text(
                                    "Gafi Soporte",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 35),
                                  ))),
                          Espacio(10, 0),
                          Container(
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 2, 2),
                                  child: logoWidget2(
                                      "assets/images/logo.jpg", 40, 50)))
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 15, 5),
                  child: Row(
                    children: <Widget>[
                      RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          print("Hola");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Prueba()));
                        },
                        child: Container(
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 20),
                            child: logoWidget(
                                "assets/images/desktop.png", 100, 100),
                          )),
                          width: 150,
                          height: 175,
                        ),
                        elevation: 20.0,
                        fillColor: Colors.red,
                      ),
                      Espacio(40, 0),
                      RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          print("Hola");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Prueba()));
                        },
                        child: Container(
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 20),
                            child: logoWidget(
                                "assets/images/desktop.png", 100, 100),
                          )),
                          width: 150,
                          height: 175,
                        ),
                        elevation: 20.0,
                        fillColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              texto(),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 40, 15, 5),
                  child: Row(
                    children: <Widget>[
                      RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          print("Hola");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Prueba()));
                        },
                        child: Container(
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 20),
                            child: logoWidget(
                                "assets/images/desktop.png", 100, 100),
                          )),
                          width: 150,
                          height: 175,
                        ),
                        elevation: 20.0,
                        fillColor: Colors.red,
                      ),
                      Espacio(40, 0),
                      RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          print("Hola");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Prueba()));
                        },
                        child: Container(
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 20),
                            child: logoWidget(
                                "assets/images/desktop.png", 100, 100),
                          )),
                          width: 150,
                          height: 175,
                        ),
                        elevation: 20.0,
                        fillColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              Espacio(0, 3),
              texto(),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 40, 15, 5),
                  child: Row(
                    children: <Widget>[
                      RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          print("Hola");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Prueba()));
                        },
                        child: Container(
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 20),
                            child: logoWidget(
                                "assets/images/desktop.png", 100, 100),
                          )),
                          width: 150,
                          height: 175,
                        ),
                        elevation: 20.0,
                        fillColor: Colors.red,
                      ),
                      Espacio(40, 0),
                      RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          print("Hola");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Prueba()));
                        },
                        child: Container(
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 20),
                            child: logoWidget(
                                "assets/images/desktop.png", 100, 100),
                          )),
                          width: 150,
                          height: 175,
                        ),
                        elevation: 20.0,
                        fillColor: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              Espacio(0, 3),
              texto(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    ));
  }
}
