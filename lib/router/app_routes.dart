import 'package:flutter/material.dart';
import 'package:soporte/models/menu_options.dart';

import 'package:soporte/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'Home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'Home': (BuildContext context) => Home_Screen(),
  };

  static final opciones = <MenuRoutes>[
    MenuRoutes(route: 'pc', name: 'Escritorio', screen: Pc_Escritorio_Screen()),
    MenuRoutes(route: 'laptop', name: 'Laptop', screen: const Laptop_Screen()),
    MenuRoutes(
        route: 'impresoras',
        name: 'impresoras',
        screen: const Impresora_Screen()),
    MenuRoutes(
        route: 'storage',
        name: 'storage',
        screen: const Units_Storage_Screen()),
    MenuRoutes(
        route: 'destruccion',
        name: 'destruccion',
        screen: const Destruccion_Screen())
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

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
