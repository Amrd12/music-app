import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';

import 'bottom_sheet_layout.dart';

class MusicBottomSheet extends StatelessWidget {
  const MusicBottomSheet({super.key, required this.scrollController});

  final DraggableScrollableController scrollController;

  @override
  Widget build(BuildContext context) {
    final Color color = MyColors.myGreyHeavy.withOpacity(.4);
    return DraggableScrollableSheet(
      controller: scrollController,
      minChildSize: 0.07,
      maxChildSize: .65,
      expand: true,
      builder: (context, scrollController) {
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: BottomSheetLayout(scrollcontroller: scrollController));
      },
    );
  }
}
