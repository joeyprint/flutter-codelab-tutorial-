import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/new_generator/new_generator.dart';
import 'package:flutter_app_test/src/routes/landing/landing.dart';

class Routing {
  static const String initialRoute = '/landing';
  static Map<String, Widget Function(BuildContext)> routes = {
    '/landing': (BuildContext context) => const Landing(),
    '/new-generator': (BuildContext context) => const NewGenerator(),
  };
}
