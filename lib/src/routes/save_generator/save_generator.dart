import 'package:flutter/material.dart';

class SaveGenerator extends StatelessWidget {
  final List<Widget> savedList;

  const SaveGenerator({
    required this.savedList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView(
        children: savedList,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      ),
    );
  }
}
