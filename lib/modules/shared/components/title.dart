import 'package:flutter/material.dart';

class CheberTitle extends StatelessWidget {
  const CheberTitle(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }
}
