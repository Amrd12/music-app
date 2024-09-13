import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(child: TextField()),
                  IconButton(onPressed: () {}, icon: Icon(Icons.abc_sharp)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
