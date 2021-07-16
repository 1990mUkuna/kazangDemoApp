import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kazang_demo/ui/screens/about_us.dart';
import 'package:kazang_demo/ui/screens/help.dart';
import 'package:kazang_demo/ui/screens/home.dart';

class RoootBottomNavigation extends StatefulWidget {
  @override
  _RoootBottomNavigationState createState() => _RoootBottomNavigationState();
}

class _RoootBottomNavigationState extends State<RoootBottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Help(), AboutUs()];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color _primaryColor = Color(0xFF30B309);
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: _primaryColor,
        items: [
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.help_center, title: 'Help'),
          TabItem(icon: Icons.person, title: 'AboutUs'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: onTappedBar,
      ),
    );
  }
}
