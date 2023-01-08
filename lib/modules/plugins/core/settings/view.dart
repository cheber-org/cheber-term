import 'package:cheber/config/theme.dart';
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
      child: Container(
        decoration: BoxDecoration(color: AppTheme.of(context).background),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CheberTitle("Settings"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
