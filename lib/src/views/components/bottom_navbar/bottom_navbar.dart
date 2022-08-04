import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_test/src/routes/landing/landing.dart';
import 'package:flutter_app_test/src/routes/generator/generator.dart';

class BottomNavbar extends StatelessWidget {
  final int? selectedIndex;
  final List<BottomNavigationBarItem> items;
  final Function(int) onNavbarTap;

  const BottomNavbar({
    this.selectedIndex,
    required this.items,
    required this.onNavbarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items: items,
        currentIndex: selectedIndex ?? 0,
        onTap: onNavbarTap,
        selectedItemColor: Colors.pink,
      ),
    );
  }
}
