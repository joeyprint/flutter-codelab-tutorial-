import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/generator/generator.dart';
import 'package:flutter_app_test/src/views/components/bottom_navbar/bottom_navbar.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);
  static const String routeName = '/landing';

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _activeNavigation = 0;

  void _handleNavigation(int index) {
    setState(() {
      _activeNavigation = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: const Text('Go to name generate page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Generator()),
            );
          },
        ),
      ),
    );
  }
}
