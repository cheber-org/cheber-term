import 'package:cheber/modules/themes/themes.controller.dart';
import 'package:get/get.dart';

import '../../../config/theme.dart';

class CheberSnackbar extends GetSnackBar {
  CheberSnackbar({
    String? message,
    Duration? duration,
    super.key,
  }) : super(
            message: message,
            duration: duration ?? const Duration(seconds: 2),
            backgroundColor: ColorUtil(
                    Get.put(ThemesController()).currentTheme.value.background)
                .withAccent(0.15));
}
