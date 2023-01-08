import 'package:flutter/material.dart';
import 'package:xterm/xterm.dart';

class CheberTheme {
  CheberTheme({
    required this.cursor,
    required this.selection,
    required this.foreground,
    required this.background,
    required this.black,
    required this.red,
    required this.green,
    required this.yellow,
    required this.blue,
    required this.magenta,
    required this.cyan,
    required this.white,
    required this.brightBlack,
    required this.brightRed,
    required this.brightGreen,
    required this.brightYellow,
    required this.brightBlue,
    required this.brightMagenta,
    required this.brightCyan,
    required this.brightWhite,
    required this.searchHitBackground,
    required this.searchHitBackgroundCurrent,
    required this.searchHitForeground,
  });

  final Color cursor;
  final Color selection;
  final Color foreground;
  final Color background;
  final Color black;
  final Color red;
  final Color green;
  final Color yellow;
  final Color blue;
  final Color magenta;
  final Color cyan;
  final Color white;
  final Color brightBlack;
  final Color brightRed;
  final Color brightGreen;
  final Color brightYellow;
  final Color brightBlue;
  final Color brightMagenta;
  final Color brightCyan;
  final Color brightWhite;
  final Color searchHitBackground;
  final Color searchHitBackgroundCurrent;
  final Color searchHitForeground;

  TerminalTheme toTerminalTheme() {
    return TerminalTheme(
        cursor: cursor,
        selection: selection,
        foreground: foreground,
        background: background,
        black: black,
        white: white,
        red: red,
        green: green,
        yellow: yellow,
        blue: blue,
        magenta: magenta,
        cyan: cyan,
        brightBlack: brightBlack,
        brightRed: brightRed,
        brightGreen: brightGreen,
        brightYellow: brightYellow,
        brightBlue: brightBlue,
        brightMagenta: brightMagenta,
        brightCyan: brightCyan,
        brightWhite: brightWhite,
        searchHitBackground: searchHitBackground,
        searchHitBackgroundCurrent: searchHitBackgroundCurrent,
        searchHitForeground: searchHitForeground);
  }
}

// solarized: &solarized
//   primary:
//     background: '0x002b36'
//     foreground: '0x839496'

//   # Normal colors
//   normal:
//     black:   '0x073642'
//     red:     '0xdc322f'
//     green:   '0x859900'
//     yellow:  '0xb58900'
//     blue:    '0x268bd2'
//     magenta: '0xd33682'
//     cyan:    '0x2aa198'
//     white:   '0xeee8d5'

//   # Bright colors
//   bright:
//     black:   '0x002b36'
//     red:     '0xcb4b16'
//     green:   '0x586e75'
//     yellow:  '0x657b83'
//     blue:    '0x839496'
//     magenta: '0x6c71c4'
//     cyan:    '0x93a1a1'
//     white:   '0xfdf6e3'

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

final solarizedTheme = CheberTheme(
  cursor: const Color(0XAAAEAFAD),
  selection: const Color(0XAAAEAFAD),
  foreground: const Color(0xff839496),
  background: const Color(0xff002b36),
  black: const Color(0xff073642),
  red: const Color(0xffdc322f),
  green: const Color(0xff859900),
  yellow: const Color(0xffb58900),
  blue: const Color(0xff268bd2),
  magenta: const Color(0xffd33682),
  cyan: const Color(0xff2aa198),
  white: const Color(0xffeee8d5),
  brightBlack: const Color(0xff002b36),
  brightRed: const Color(0xffcb4b16),
  brightGreen: const Color(0xff586e75),
  brightYellow: const Color(0xff657b83),
  brightBlue: const Color(0xff839496),
  brightMagenta: const Color(0xff6c71c4),
  brightCyan: const Color(0xff93a1a1),
  brightWhite: const Color(0xfffdf6e3),
  searchHitBackground: defaultCheberTheme.searchHitBackground,
  searchHitBackgroundCurrent: defaultCheberTheme.searchHitBackgroundCurrent,
  searchHitForeground: defaultCheberTheme.searchHitForeground,
);

class AppTheme extends InheritedWidget {
  final CheberTheme theme;

  const AppTheme({required this.theme, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CheberTheme of(BuildContext context) {
    var appTheme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (appTheme == null) {
      return defaultCheberTheme;
    }

    return appTheme.theme;
  }
}

final lightTheme = ThemeData.light();
final darkTheme = ThemeData.dark();
