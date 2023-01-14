import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/area-manager/view.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:cheber/modules/window-manager/platform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/themes/themes.controller.dart';
import 'modules/plugins/core/settings/settings.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowDecorations.setup();
  await GetStorage.init();

  runApp(const App());

  doWhenWindowReady(() {
    appWindow.show();
  });
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemesController themesController = Get.put(ThemesController());
  SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SettingsProvider(
        settings: AppSettings(
          theme: themesController.currentTheme.value,
          terminalSettings: settingsController.terminalSettings.value,
        ),
        child: GetMaterialApp(
          title: 'Cheber',
          theme: lightTheme,
          darkTheme: darkTheme.copyWith(
              scaffoldBackgroundColor:
                  themesController.currentTheme.value.background,
              snackBarTheme: SnackBarThemeData(
                  backgroundColor:
                      themesController.currentTheme.value.background)),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const AreaManagerView(),
          },
        ),
      ),
    );
  }
}
