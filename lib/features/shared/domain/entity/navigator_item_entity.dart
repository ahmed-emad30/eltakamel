import 'package:flutter/material.dart' show IconData;

class NavigatorItemEntity{
  final String title;
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String route;

  const NavigatorItemEntity({
    required this.title,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.route,
  });
}
