import 'package:flutter/material.dart';
import 'package:xterm/ui.dart';

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
    this.name,
  });

  final String? name;
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

  static CheberTheme fromMap(Map data) {
    Map colors = Map.fromEntries((data['colors'] as Map)
        .entries
        .map((entry) => MapEntry(entry.key, Color(entry.value))));

    return CheberTheme(
      name: data['name'],
      cursor: colors['cursor'],
      selection: colors['selection'],
      foreground: colors['foreground'],
      background: colors['background'],
      black: colors['black'],
      white: colors['white'],
      red: colors['red'],
      green: colors['green'],
      yellow: colors['yellow'],
      blue: colors['blue'],
      magenta: colors['magenta'],
      cyan: colors['cyan'],
      brightBlack: colors['bright_black'],
      brightRed: colors['bright_red'],
      brightGreen: colors['bright_green'],
      brightYellow: colors['bright_yellow'],
      brightBlue: colors["bright_blue"],
      brightMagenta: colors['bright_magenta'],
      brightCyan: colors['bright_cyan'],
      brightWhite: colors['bright_white'],
      searchHitBackground: colors['search_hit_background'],
      searchHitBackgroundCurrent: colors['search_hit_background_current'],
      searchHitForeground: colors['search_hit_foreground'],
    );
  }
}
