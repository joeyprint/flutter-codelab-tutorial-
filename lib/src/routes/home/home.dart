import 'package:flutter/material.dart';

import 'package:flutter_app_test/src/routes/landing/landing.dart';
import 'package:flutter_app_test/src/routes/generator/generator.dart';
import 'package:flutter_app_test/src/views/components/bottom_navbar/bottom_navbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _activeNavigation = 0;

  final List<Widget> _pageList = [
    Landing(),
    Generator(),
  ];

  final List<String> _pageNameList = ['Landing', 'Generator'];

  void _handleNavigation(int index) {
    setState(() {
      _activeNavigation = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageNameList[_activeNavigation]),
      ),
      body: IndexedStack(
        index: _activeNavigation,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavbar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Generator',
          ),
        ],
        selectedIndex: _activeNavigation,
        onNavbarTap: _handleNavigation,
      ),
    );
  }
}
