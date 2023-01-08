import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/shared/components/input.dart';
import 'package:cheber/modules/shared/components/title.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(color: AppTheme.of(context).background),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      CheberTitle("Settings"),
                      CheberInput(
                        placeholder: "Font family",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, bottom: 14, top: 10),
                decoration: const BoxDecoration(color: Colors.red),
                child: const Text("asd"),
              ))
        ],
      ),
    );
  }
}
