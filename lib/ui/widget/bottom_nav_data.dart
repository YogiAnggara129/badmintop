import 'package:flutter/material.dart';
import 'package:badmintop/ui/screen/home_screen.dart';
import 'package:badmintop/ui/screen/explore_screen.dart';
import 'package:badmintop/ui/screen/save_screen.dart';

class MyBottomNavigation extends StatefulWidget {
  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ExploreScreen(),
    SaveScreen(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}