import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/new_generator/new_generator.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);
  static const String routeName = '/landing';

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to name generate page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewGenerator()),
            );
          },
        ),
      ),
    );
  }
}
