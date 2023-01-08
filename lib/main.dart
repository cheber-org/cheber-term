import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/area-manager/view.dart';
import 'package:cheber/modules/window-manager/platform.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WindowDecorations.setup();

  runApp(const App());
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
