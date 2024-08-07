import 'package:flutter/material.dart';
import 'package:musicapp/ui/screens/Navigation_Item.dart';

import '../../constans/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;
  List<Widget> screen = NavigationItem.values.map((t) => t.body).toList();
  void _onDestinationSelected(int selectedIndex) {
    index = selectedIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: screen),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          currentIndex: index,
          onTap: _onDestinationSelected,
          items: NavigationItem.values
              .map((i) => i.bottomNavigationBarItem)
              .toList()),
    );
  }
}
