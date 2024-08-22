import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/data/models/music_model.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    super.key,
    required this.scrollController,
    required this.maxSize,
    required this.minSize,
    required this.initSize,
    required this.screen,
    required this.bgcolor,
  });

  final DraggableScrollableController scrollController;

  final double maxSize, minSize, initSize;
  final Widget screen;
  final Color bgcolor;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: scrollController,
      initialChildSize: initSize,
      minChildSize: minSize,
      maxChildSize: maxSize,
      expand: true,
      builder: (context, scrollController) {
        return Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: screen);
      },
    );
  }
}
