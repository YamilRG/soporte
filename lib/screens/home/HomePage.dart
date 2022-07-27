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

// Route _createRoute() {
//   final opciones = AppRoutes.opciones;
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => ,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
