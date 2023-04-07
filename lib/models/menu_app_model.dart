import 'package:flutter/material.dart';

class MenuAppModel {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final Color color;

  MenuAppModel({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });
}
