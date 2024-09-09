import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final DraggableScrollableController scrollController;
  final double maxSize, minSize, initSize;
  final Color bgcolor;
  // final Widget screen;
  final Widget Function(
      BuildContext constext, ScrollController scrollContraoller) screen;

  const CustomBottomSheet({
    super.key,
    required this.scrollController,
    required this.maxSize,
    required this.minSize,
    required this.initSize,
    required this.screen,
    this.bgcolor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: scrollController,
      initialChildSize: initSize,
      minChildSize: minSize,
      maxChildSize: maxSize,
      expand: false,
      builder: (context, s) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: screen(context, s),
        );
      },
    );
  }
}
