import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

class WindowDecorations {
  static Future<void> setup() async {
    print("init");
    await Window.initialize();
    await Window.makeTitlebarTransparent();
    await Window.enableFullSizeContentView();
    await Window.addToolbar();
    await Window.setToolbarStyle(
        toolbarStyle: MacOSToolbarStyle.unifiedCompact);
    Window.hideTitle();

    await Window.setEffect(
        effect: WindowEffect.acrylic, color: Colors.transparent);
    await Window.setBlurViewState(MacOSBlurViewState.active);
  }
}
