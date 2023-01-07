import 'package:cheber/config/theme.dart';
import 'package:cheber/modules/area-manager/view.dart';
import 'package:cheber/modules/window-manager/platform.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WindowDecorations.setup();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cheber',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const AreaManagerView(),
        ),
      ],
    );
  }
}
