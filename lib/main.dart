import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/area-manager/view.dart';
import 'package:cheber/modules/window-manager/platform.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowDecorations.setup();

  runApp(const App());

  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: solarizedTheme,
      // theme: defaultCheberTheme,
      child: MaterialApp(
        title: 'Cheber',
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => const AreaManagerView(),
        },
      ),
    );
  }
}
