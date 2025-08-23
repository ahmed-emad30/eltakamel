import 'package:flutter/material.dart';

class DrawerEntity {
  final String title;
  final IconData? icon;
  final int page;

  const DrawerEntity({required this.title, this.icon, required this.page});
}
