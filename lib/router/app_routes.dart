import 'package:flutter/material.dart';
import 'package:soporte/models/menu_options.dart';

import 'package:soporte/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'Home';

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'Home': (BuildContext context) => Home_Screen(),
  // };

  static final opciones = <MenuRoutes>[
    MenuRoutes(route: 'pc', name: 'Escritorio', screen: Pc_Escritorio_Screen()),
    MenuRoutes(route: 'laptop', name: 'Laptop', screen: const Laptop_Screen()),
    MenuRoutes(
        route: 'Impresoras',
        name: 'Impresoras',
        screen: const Impresora_Screen()),
    MenuRoutes(
        route: 'Storage',
        name: 'Storage',
        screen: const Units_Storage_Screen()),
    MenuRoutes(
        route: 'Destrucción',
        name: 'Destrucción',
        screen: const Destruccion_Screen())
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      'Home': (BuildContext context) => Login_page_final_Screen(),
    });

    for (final option in opciones) {
      appRoutes.addAll({
        option.route: (BuildContext context) => option.screen,
      });
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => Home_Screen());
  }
}

Route _createRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
