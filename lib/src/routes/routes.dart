import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/new_generator/new_generator.dart';

class Routing {
  static const String initialRoute = '/';
  static Map<String, Widget Function(BuildContext)> routes = {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (BuildContext context) => const NewGenerator(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    // '/second': (context) => const SecondScreen(),
  };
}
