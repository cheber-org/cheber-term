import 'package:get/get.dart';

import '../../../shared/components/snackbar.dart';
import '../../../shared/services/storage.service.dart';
import 'model.dart';

class SettingsController extends GetxController {
  final terminalSettings = Rx(TerminalSettings());
  final storageService = Get.put(StorageService());

  @override
  onInit() async {
    terminalSettings.value = TerminalSettings.fromMap(
      await storageService.read("terminalSettings") ?? {},
    );
    super.onInit();
  }

  setTerminalSettings(TerminalSettings settings) async {
    terminalSettings.value = settings;
    await storageService.write(
      "terminalSettings",
      terminalSettings.value.toMap(),
    );
    await Get.closeCurrentSnackbar();
    Get.showSnackbar(CheberSnackbar(message: "Settings changed"));
  }
}
