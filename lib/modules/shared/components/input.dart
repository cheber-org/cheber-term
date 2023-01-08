import 'package:flutter/material.dart';

class CheberInput extends StatefulWidget {
  const CheberInput({this.placeholder, super.key});

  final String? placeholder;

  @override
  State<CheberInput> createState() => _CheberInputState();
}

class _CheberInputState extends State<CheberInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration.collapsed(
          hintText: widget.placeholder,
        ).copyWith(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
      ),
    );
  }
}
