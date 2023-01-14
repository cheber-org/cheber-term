import 'package:cheber/modules/plugins/core/settings/components/save_settings.dart';
import 'package:cheber/modules/plugins/core/settings/components/settings_page.dart';
import 'package:cheber/modules/shared/components/input.dart';
import 'package:cheber/modules/shared/components/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late double fontSize = settingsController.terminalSettings.value.fontSize;

  onSave() {
    settingsController.setTerminalSettings(TerminalSettings(
      fontFamily: fontFamily,
      fontSize: fontSize,
    ));
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
              placeholder: "Font size",
              value: fontSize.toString(),
              formatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$'))
              ],
              onChanged: (value) {
                var newValue = double.tryParse(value);
                if (newValue != null) {
                  setState(() {
                    fontSize = newValue;
                  });
                }
              }),
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
