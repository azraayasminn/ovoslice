import 'package:flutter/material.dart';

class _MenuItem {
  final String label;
  final IconData icon;
  final Color color;
  final String? badge;

  const _MenuItem(this.label, this.icon, this.color, [this.badge]);
}