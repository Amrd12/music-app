import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';

class MusicBottomSheet extends StatelessWidget {
  const MusicBottomSheet({super.key, required this.scrollController});
  final DraggableScrollableController scrollController;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: scrollController,
      initialChildSize: 0.5,
      minChildSize: 0.1,
      maxChildSize: .71,
      expand: true,
      builder: (context, scrollController) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: MyColors.myGreyHeavy,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0, backgroundColor: Colors.transparent),
                  onPressed: () {},
                  child: Text(
                    "Lyrics",
                    style: TextStyleManger.secTextLexendWhite,
                  ),
                ),
                const Icon(Icons.arrow_upward),
                // Add more content here if needed
              ],
            ),
          ),
        );
      },
    );
  }
}
