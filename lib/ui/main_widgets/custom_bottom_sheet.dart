import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final DraggableScrollableController scrollController;
  final double maxSize, minSize, initSize;
  final Color bgcolor;
  final Widget Function(BuildContext context, ScrollController scrollController)
      builder;

  CustomBottomSheet({
    super.key,
    required this.scrollController,
    required this.maxSize,
    required this.minSize,
    required this.initSize,
    required this.builder,
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
      builder: (context, scrollController) {
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: builder(context, scrollController),
        );
      },
    );
  }
}
