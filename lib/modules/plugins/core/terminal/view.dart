import 'dart:convert';
import 'dart:io';

import 'package:cheber/modules/plugins/core/settings/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:xterm/xterm.dart';

class TermView extends StatefulWidget {
  const TermView({super.key});

  @override
  State<TermView> createState() => _TermViewState();
}

class _TermViewState extends State<TermView> {
  Terminal terminal = Terminal(maxLines: 10000);
  final terminalController = TerminalController();
  final scrollController = ScrollController();
  late final Pty pty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) _startPty();
      },
    );
  }

  @override
  void dispose() {
    pty.kill();
    super.dispose();
  }

  void _startPty() {
    final shell = _platformShell;
    pty = Pty.start(
      shell.command,
      arguments: shell.args,
      columns: terminal.viewWidth,
      rows: terminal.viewHeight,
    );

    pty.output
        .cast<List<int>>()
        .transform(const Utf8Decoder())
        .listen(terminal.write);

    pty.exitCode.then((code) {
      terminal.write('the process exited with exit code $code');
    });

    terminal.onOutput = (data) {
      pty.write(const Utf8Encoder().convert(data));
    };

    terminal.onResize = (w, h, pw, ph) {
      pty.resize(h, w);
    };
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: TerminalView(
        terminal,
        padding: const EdgeInsets.all(5),
        controller: terminalController,
        autofocus: true,
        textStyle: TerminalStyle.fromTextStyle(
          TextStyle(
            fontFamily:
                SettingsProvider.of(context).terminalSettings.fontFamily,
          ),
        ),
        simulateScroll: true,
        scrollController: scrollController,
        theme: SettingsProvider.of(context).theme.toTerminalTheme(),
        hardwareKeyboardOnly: true,
        backgroundOpacity: 0.7,
      ),
    );
  }
}

class _ShellCommand {
  final String command;

  final List<String> args;

  _ShellCommand(this.command, this.args);
}

_ShellCommand get _platformShell {
  if (Platform.isMacOS) {
    final user = Platform.environment['USER'];
    return _ShellCommand('login', ['-fp', user!]);
  }

  if (Platform.isWindows) {
    return _ShellCommand('cmd.exe', []);
  }

  final shell = Platform.environment['SHELL'] ?? 'sh';
  return _ShellCommand(shell, []);
}
