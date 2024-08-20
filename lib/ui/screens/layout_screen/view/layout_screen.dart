import 'package:flutter/material.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/ui/screens/navigation_item.dart';
import 'package:musicapp/ui/screens/player_screens/player_mini_screen/view/player_mini_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> screen = NavigationItem.values.map((t) => t.body).toList();
  void _onDestinationSelected(int selectedIndex) {
    index = selectedIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: IndexedStack(index: index, children: screen)),
          PlayerMiniScreen()
        ],
      ),
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
