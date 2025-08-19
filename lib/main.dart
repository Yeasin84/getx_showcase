import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app_theme.dart';
import 'src/app_routes.dart';
import 'src/bindings/app_bindings.dart';
import 'src/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Showcase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.cupertino, // smooth, platform‑friendly
      transitionDuration: const Duration(milliseconds: 240),
      initialBinding: AppBindings(), // DI lives here
      getPages: AppRoutes.pages,
      home: const HomePage(),
    );
  }
}
