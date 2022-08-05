import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/articles/articles.dart';
import 'package:flutter_app_test/src/routes/home/home.dart';
import 'package:flutter_app_test/src/routes/generator/generator.dart';
import 'package:flutter_app_test/src/routes/landing/landing.dart';

class Routing {
  static const String initialRoute = '/';
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const Home(),
    '/articles': (BuildContext context) => const Articles(),
    '/landing': (BuildContext context) => const Landing(),
    '/generator': (BuildContext context) => const Generator(),
  };
}
