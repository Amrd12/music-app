import 'package:flutter/material.dart';
import 'package:musicapp/ui/screens/home_screen/view/home_screen.dart';
import 'package:musicapp/ui/screens/search_screen/view/search_screen.dart';
import '../../constans/strings.dart';

enum NavigationItem {
  search(searchRoute, Icons.search, Icons.search, SearchScreen()),
  home(homeRoute, Icons.home_outlined, Icons.home, HomeScreen()),
  collection(homeRoute, Icons.home_outlined, Icons.home, HomeScreen());

  const NavigationItem(this.routeName, this.icon, this.selectedIcon, this.body);

  final String routeName;
  final IconData icon;
  final IconData selectedIcon;
  final Widget body;

  BottomNavigationBarItem get bottomNavigationBarItem {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(selectedIcon),
      label: routeName.replaceFirst("/", "").toUpperCase(),
    );
  }
}
