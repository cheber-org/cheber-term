import 'package:cheber/modules/shared/services/storage.service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';

import '../shared/components/snackbar.dart';
import 'models.dart';

final defaultCheberTheme = CheberTheme(
  cursor: const Color(0XAAAEAFAD),
  selection: const Color(0XAAAEAFAD),
  foreground: const Color(0XFFCCCCCC),
  background: const Color(0XFF1E1E1E),
  black: const Color(0XFF000000),
  red: const Color(0XFFCD3131),
  green: const Color(0XFF0DBC79),
  yellow: const Color(0XFFE5E510),
  blue: const Color(0XFF2472C8),
  magenta: const Color(0XFFBC3FBC),
  cyan: const Color(0XFF11A8CD),
  white: const Color(0XFFE5E5E5),
  brightBlack: const Color(0XFF666666),
  brightRed: const Color(0XFFF14C4C),
  brightGreen: const Color(0XFF23D18B),
  brightYellow: const Color(0XFFF5F543),
  brightBlue: const Color(0XFF3B8EEA),
  brightMagenta: const Color(0XFFD670D6),
  brightCyan: const Color(0XFF29B8DB),
  brightWhite: const Color(0XFFFFFFFF),
  searchHitBackground: const Color(0XFFFFFF2B),
  searchHitBackgroundCurrent: const Color(0XFF31FF26),
  searchHitForeground: const Color(0XFF000000),
);

class ThemesController extends GetxController {
  final storageService = Get.put(StorageService());

  final themes = RxList<CheberTheme>();
  final currentTheme = Rx<CheberTheme>(defaultCheberTheme);

  final _definedThemes = [
    "default_dark",
    "solarized_dark",
    "tokyo_night",
  ];

  @override
  onInit() async {
    await loadThemes();
    final currentThemeName =
        await storageService.read('currentThemeName') ?? "Default dark";
    currentTheme.value =
        themes.firstWhereOrNull((theme) => theme.name == currentThemeName) ??
            currentTheme.value;
    super.onInit();
  }

  loadThemes() async {
    final themes = await Future.wait(
      _definedThemes.map(
        (file) => rootBundle
            .loadString('lib/modules/themes/defined/$file.yml')
            .then(loadYaml)
            .then((yaml) => CheberTheme.fromMap(yaml)),
      ),
    );
    this.themes.assignAll(themes);
  }

  setCurrentTheme(CheberTheme theme) async {
    if (theme == currentTheme.value) return;
    currentTheme.value = theme;
    await Get.closeCurrentSnackbar();
    Get.showSnackbar(
      CheberSnackbar(
        message: "Theme changed",
      ),
    );
    storageService.write('currentThemeName', theme.name);
  }
}
