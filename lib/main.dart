import 'package:finboard_app/di/service_locator.dart';
import 'package:finboard_app/screens/search_screen.dart';
import 'package:finboard_app/stores/app_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

void main() {
  setup();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
        ),
        title: 'Finboard',
        initialRoute: '/',
        routes: {
          SearchScreen.routeName : (context) => SearchScreen(),
          HomeScreen.routeName : (context) => HomeScreen(),
        },
      ),
    );
  }
}
