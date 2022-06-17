import 'package:flutter/material.dart';
import 'package:soporte/screens/prueba.dart';
import 'package:path/path.dart' as Path;

/*
TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 0, 0, 0),
    style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
    decoration: InputDecoration(
      isCollapsed: true,
      contentPadding: EdgeInsets.all(15),
      prefixIcon: Icon(icon, color: Color.fromARGB(255, 255, 0, 0)),
      labelText: text,
      labelStyle:
          TextStyle(color: Color.fromARGB(255, 255, 0, 0).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}*/
Image logoWidget(String imageName, double tamano1, double tamano2) {
  return Image.asset(imageName,
      fit: BoxFit.fitHeight,
      width: tamano1,
      height: tamano2,
      color: Color.fromARGB(255, 255, 255, 255));
}

Image logoWidget2(String imageName, double tamano1, double tamano2) {
  return Image.asset(imageName,
      fit: BoxFit.fitHeight, width: tamano1, height: tamano2);
}

Container texto() {
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
      child: Row(
        children: <Widget>[
          Container(
            width: 150,
            height: 15,
            child: Center(child: Text("Hola")),
          ),
          Espacio(40, 0),
          Container(
            width: 150,
            height: 15,
            child: Center(child: Text("Hola")),
          )
        ],
      ),
    ),
  );
}

SizedBox Espacio(double espacio, double espacio2) {
  return SizedBox(
    width: espacio,
    height: espacio2,
  );
}

Container reusableTextField2(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return Container(
    width: 280,
    child: TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Color.fromARGB(255, 0, 0, 0),
      style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
      decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 255, 0, 0)),
          labelText: text,
          labelStyle:
              TextStyle(color: Color.fromARGB(255, 255, 0, 0).withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Color.fromARGB(0, 0, 0, 0)),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    ),
  );
}
