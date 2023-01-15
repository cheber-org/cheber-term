import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:cheber/modules/shared/components/tabs.dart';
import 'package:flutter/material.dart';

class WindowBar extends StatelessWidget {
  const WindowBar({
    super.key,
    required this.tabs,
    required this.settings,
  });
  final CheberTabs tabs;
  final Widget settings;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SettingsProvider.of(context).theme.background,
        border: Border(
          bottom: BorderSide(
            color: ColorUtil(SettingsProvider.of(context).theme.background)
                .withAccent(0.15)
                .withOpacity(1),
          ),
        ),
      ),
      height: 38,
      child: MoveWindow(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (Platform.isMacOS) const SizedBox(width: 76),
            Expanded(child: tabs),
            settings,
            const SizedBox(width: 8),
            if (Platform.isWindows) const WindowsWindowControls(),
          ],
        ),
      ),
    );
  }
}

class WindowsWindowControls extends StatelessWidget {
  const WindowsWindowControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    const closeButtonColor = Color.fromRGBO(232, 17, 35, 1);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MinimizeWindowButton(
          colors: WindowButtonColors(
            iconNormal:
                brightness == Brightness.light ? Colors.black : Colors.white,
            iconMouseDown:
                brightness == Brightness.light ? Colors.black : Colors.white,
            iconMouseOver:
                brightness == Brightness.light ? Colors.black : Colors.white,
            normal: Colors.transparent,
            mouseOver: brightness == Brightness.light
                ? Colors.black.withOpacity(0.04)
                : Colors.white.withOpacity(0.04),
            mouseDown: brightness == Brightness.light
                ? Colors.black.withOpacity(0.08)
                : Colors.white.withOpacity(0.08),
          ),
        ),
        MaximizeWindowButton(
          colors: WindowButtonColors(
            iconNormal:
                brightness == Brightness.light ? Colors.black : Colors.white,
            iconMouseDown:
                brightness == Brightness.light ? Colors.black : Colors.white,
            iconMouseOver:
                brightness == Brightness.light ? Colors.black : Colors.white,
            normal: Colors.transparent,
            mouseOver: brightness == Brightness.light
                ? Colors.black.withOpacity(0.04)
                : Colors.white.withOpacity(0.04),
            mouseDown: brightness == Brightness.light
                ? Colors.black.withOpacity(0.08)
                : Colors.white.withOpacity(0.08),
          ),
        ),
        CloseWindowButton(
          colors: WindowButtonColors(
            iconNormal:
                brightness == Brightness.light ? Colors.black : Colors.white,
            iconMouseDown:
                brightness == Brightness.light ? Colors.black : Colors.white,
            iconMouseOver:
                brightness == Brightness.light ? Colors.black : Colors.white,
            normal: Colors.transparent,
            mouseOver: brightness == Brightness.light
                ? closeButtonColor
                : closeButtonColor,
            mouseDown: brightness == Brightness.light
                ? closeButtonColor.withOpacity(0.6)
                : closeButtonColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
