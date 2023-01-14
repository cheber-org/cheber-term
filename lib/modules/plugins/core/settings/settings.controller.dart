import 'package:get/get.dart';

import '../../../shared/components/snackbar.dart';
import '../../../shared/services/storage.service.dart';
import 'model.dart';

class SettingsController extends GetxController {
  final terminalSettings = Rx(TerminalSettings());
  final storageServide = Get.put(StorageService());

  @override
  onInit() async {
    terminalSettings.value = TerminalSettings.fromMap(
      await storageServide.read("terminalSettings") ?? {},
    );
    super.onInit();
  }

  setTerminalSettings(TerminalSettings settings) async {
    terminalSettings.value = settings;
    await storageServide.write(
      "terminalSettings",
      terminalSettings.value.toMap(),
    );

    Get.showSnackbar(CheberSnackbar(message: "Settings changed"));
  }
}
