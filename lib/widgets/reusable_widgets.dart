import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:soporte/theme/themes.dart';

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

/////////////////////////////////////////////////////////////////////////////////////
Image logoWidget(String imageName, double tamano1, double tamano2) {
  return Image.asset(imageName,
      fit: BoxFit.fitHeight,
      width: tamano1,
      height: tamano2,
      color: const Color.fromARGB(255, 0, 0, 0));
}

/////////////////////////////////////////////////////////////////////////////////////

Image logoWidget3(String imageName, double tamano1, double tamano2) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitHeight,
    width: tamano1,
    height: tamano2,
  );
}

/////////////////////////////////////////////////////////////////////////////////////
Image logoWidget2(String imageName, double tamano1, double tamano2) {
  return Image.asset(imageName,
      fit: BoxFit.fitHeight, width: tamano1, height: tamano2);
}

/////////////////////////////////////////////////////////////////////////////////////

Container texto() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
            width: 150,
            height: 15,
            child: const Center(child: const Text("Hola")),
          ),
          Espacio(20, 0),
          /*Container(
            width: 150,
            height: 15,
            child: Center(child: Text("Hola")),
          )*/
        ],
      ),
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////

SizedBox Espacio(double espacio, double espacio2) {
  return SizedBox(
    width: espacio,
    height: espacio2,
  );
}

/////////////////////////////////////////////////////////////////////////////////////
Container reusableTextField2(String hinto, String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      style: const TextStyle(color: AppTheme.primary),
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          hintText: hinto,
          isCollapsed: true,
          labelText: text,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(icon, color: AppTheme.primary),
          labelStyle: TextStyle(color: AppTheme.primary.withOpacity(0.5)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: const Color.fromARGB(0, 194, 65, 65)),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////


