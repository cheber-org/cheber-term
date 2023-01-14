import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cheber/modules/shared/components/tabs.dart';
import 'package:flutter/material.dart';

class WindowBar extends StatelessWidget {
  final CheberTabs tabs;
  const WindowBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    if (Platform.isWindows) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 32,
        color: Colors.transparent,
        child: MoveWindow(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: tabs),
              MinimizeWindowButton(
                colors: WindowButtonColors(
                  iconNormal: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  iconMouseDown: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  iconMouseOver: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
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
                  iconNormal: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  iconMouseDown: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  iconMouseOver: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
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
                onPressed: () {
                  appWindow.close();
                },
                colors: WindowButtonColors(
                  iconNormal: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  iconMouseDown: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  iconMouseOver: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  normal: Colors.transparent,
                  mouseOver: brightness == Brightness.light
                      ? Colors.black.withOpacity(0.04)
                      : Colors.white.withOpacity(0.04),
                  mouseDown: brightness == Brightness.light
                      ? Colors.black.withOpacity(0.08)
                      : Colors.white.withOpacity(0.08),
                ),
              ),
            ],
          ),
        ),
      );
    }
    if (Platform.isMacOS) {
      return tabs;
    }
    return Container();
  }
}
