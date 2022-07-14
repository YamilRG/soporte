import 'package:flutter/material.dart';
import 'package:soporte/router/app_routes.dart';

class Home_Screen extends StatelessWidget {
  final opciones = AppRoutes.opciones;
  Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Prueba de menu'))),
        body: ListView.separated(
            itemBuilder: (context, i) => ListTile(
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: Text(opciones[i].name),
                  onTap: () {
                    Navigator.pushNamed(context, opciones[i].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: opciones.length));
  }
}
