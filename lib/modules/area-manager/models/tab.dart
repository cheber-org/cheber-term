import 'package:flutter/material.dart';

class TabItem {
  const TabItem({
    required this.title,
    required this.child,
  });

  final Widget title;
  final Widget child;
}
