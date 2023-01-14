import 'package:flutter/material.dart';

import '../../../themes/models.dart';

class TerminalSettings {
  TerminalSettings({
    this.fontFamily,
    this.fontSize = 12,
  });

  String? fontFamily;
  double fontSize;

  static TerminalSettings fromMap(Map data) {
    try {
      return TerminalSettings(
        fontFamily: data['fontFamily'],
        fontSize: data['fontSize'],
      );
    } catch (_) {
      return TerminalSettings();
    }
  }

  Map toMap() {
    return {
      'fontFamily': fontFamily,
      'fontSize': fontSize,
    };
  }
}

class AppSettings {
  AppSettings({
    required this.terminalSettings,
    required this.theme,
  });

  CheberTheme theme;
  TerminalSettings terminalSettings;
}

class SettingsProvider extends InheritedWidget {
  const SettingsProvider({
    required this.settings,
    required Widget child,
    super.key,
  }) : super(child: child);

  final AppSettings settings;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }

  static AppSettings of(BuildContext context) {
    var instance =
        context.dependOnInheritedWidgetOfExactType<SettingsProvider>();

    return instance!.settings;
  }
}
