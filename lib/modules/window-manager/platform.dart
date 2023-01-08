import 'dart:ui';
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

    await Window.setEffect(effect: WindowEffect.aero, color: Color(0x00FFFFFF));
    await Window.setBlurViewState(MacOSBlurViewState.active);
  }
}
