import 'package:cheber/modules/shared/components/theme_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/themes.controller.dart';
import '../components/settings_page.dart';

class ThemesSettings extends StatefulWidget {
  const ThemesSettings({super.key});

  @override
  State<ThemesSettings> createState() => _ThemesSettingsState();
}

class _ThemesSettingsState extends State<ThemesSettings> {
  final themesController = Get.put(ThemesController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageWrapper(
      child: Obx(
        () => Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...themesController.themes.map(
              (theme) => ThemePreviewCard(
                onClick: () {
                  themesController.setCurrentTheme(theme);
                },
                theme: theme,
                isActive: theme == themesController.currentTheme.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
