import 'package:flutter/material.dart';
import 'package:soporte/models/menu_options.dart';

import 'package:soporte/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'Home';

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'Home': (BuildContext context) => Home_Screen(),
  // };

  static final opciones = <MenuRoutes>[
    MenuRoutes(
        icon: Icons.desktop_windows_outlined,
        route: 'pc',
        name: 'Escritorio',
        screen: Pc_Escritorio_Screen()),
    MenuRoutes(
        icon: Icons.laptop_rounded,
        route: 'laptop',
        name: 'Laptop',
        screen: const Laptop_Screen()),
    MenuRoutes(
        icon: Icons.local_printshop_sharp,
        route: 'Impresoras',
        name: 'Impresoras',
        screen: const Impresora_Screen()),
    MenuRoutes(
        icon: Icons.storage_rounded,
        route: 'Storage',
        name: 'Storage',
        screen: const Units_Storage_Screen()),
    MenuRoutes(
        icon: Icons.desktop_access_disabled_rounded,
        route: 'Destrucción',
        name: 'Destrucción',
        screen: const Destruccion_Screen())
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      'Home': (BuildContext context) => HomeScreen_final(),
    });

    for (final option in opciones) {
      appRoutes.addAll({
        option.route: (BuildContext context) => option.screen,
      });
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => HomeScreen_final());
  }
}
