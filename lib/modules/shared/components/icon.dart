import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

typedef CheberIcons = TablerIcons;

class CheberIcon extends StatelessWidget {
  const CheberIcon(this.icon, {this.size, this.color, super.key});
  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Transform.translate(offset: const Offset(0, -1)).transform,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
