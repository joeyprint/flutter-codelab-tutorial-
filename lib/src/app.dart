import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/new_generator/new_generator.dart';
import 'package:flutter_app_test/src/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Generator App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: Routing.initialRoute,
      routes: Routing.routes,
    );
  }
}
