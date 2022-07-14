import 'package:flutter/material.dart';
import 'package:soporte/widgets/card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Prueba")),
        ),
        body: Column(
          children: [
            card_widget("Laboris qui aute id cillum quis ad reprehenderit do.")
          ],
        ));
  }
}
