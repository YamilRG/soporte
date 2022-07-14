import 'package:flutter/material.dart';

Card card_widget(String info) {
  return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: <Widget>[
            const Image(
              image: AssetImage("assets/images/logoXme.png"),
            ),
            const Divider(height: 1.0, thickness: 1.0),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(info),
            ),
          ],
        ),
      ));
}
