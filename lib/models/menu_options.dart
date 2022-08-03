import 'package:flutter/material.dart';

class MenuRoutes {
  final String route;
  final String name;
  final IconData icon;
  final Widget screen;

  MenuRoutes({
    required this.route,
    required this.name,
    required this.screen,
    required this.icon,
  });
}
