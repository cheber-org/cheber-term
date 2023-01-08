import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

class WindowDecorations {
  static Future<void> setup() async {
    await Window.initialize();
    await Window.makeTitlebarTransparent();
    await Window.enableFullSizeContentView();
    await Window.addToolbar();
    if (Platform.isWindows) {
      await Window.hideWindowControls();
    }
    await Window.setToolbarStyle(
        toolbarStyle: MacOSToolbarStyle.unifiedCompact);
    await Window.hideTitle();

    await Window.setEffect(
        effect: WindowEffect.aero, color: Colors.transparent);
    await Window.setBlurViewState(MacOSBlurViewState.active);
  }
}
