import 'package:finboard_app/di/service_locator.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  setup();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'Finboard',
      home: HomeScreen(),
    );
  }
}


