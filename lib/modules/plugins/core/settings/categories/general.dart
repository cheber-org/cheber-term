import 'package:cheber/modules/plugins/core/settings/components/save_settings.dart';
import 'package:cheber/modules/plugins/core/settings/components/settings_page.dart';
import 'package:cheber/modules/shared/components/input.dart';
import 'package:cheber/modules/shared/components/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model.dart';
import '../settings.controller.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  final SettingsController settingsController = Get.put(SettingsController());

  late String fontFamily =
      settingsController.terminalSettings.value.fontFamily ?? '';

  onSave() {
    settingsController
        .setTerminalSettings(TerminalSettings(fontFamily: fontFamily));
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageWrapper(
      footer: SaveSettingsFooter(onSave: onSave),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CheberTitle("Settings"),
          const SizedBox(
            height: 10,
          ),
          CheberInput(
              placeholder: "Font family",
              value: fontFamily,
              onChanged: (value) {
                setState(() {
                  fontFamily = value;
                });
              }),
        ],
      ),
    );
  }
}
