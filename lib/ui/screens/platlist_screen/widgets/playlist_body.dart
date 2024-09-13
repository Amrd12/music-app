
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/data/models/playlist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_bottom_sheet.dart';
import 'package:musicapp/ui/screens/platlist_screen/widgets/playlist_item_full.dart';
import 'package:musicapp/ui/screens/platlist_screen/widgets/playlist_item_mini.dart';
import 'package:musicapp/ui/screens/platlist_screen/widgets/playlist_list.dart';


class PlaylistBody extends StatefulWidget {
  const PlaylistBody({super.key, required this.model});
  final PlaylistModel model;

  @override
  State<PlaylistBody> createState() => _PlaylistBodyState();
}

class _PlaylistBodyState extends State<PlaylistBody> {
  late DraggableScrollableController scrollController;
  double height = 0.0;

  @override
  void initState() {
    super.initState();
    scrollController = DraggableScrollableController();
    scrollController.addListener(changeSize);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(.3);
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(changeSize);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              if (height < .61)
                PlaylistItemFull(model: widget.model, size: (1 - height)),
              if (height >= .61)
                SizedBox(
                  height: (1 - height) * MediaQuery.of(context).size.height,
                  child: PlaylistItemMini(model: widget.model),
                ),
              Expanded(
                  child: SizedBox(
                      height: height * MediaQuery.of(context).size.height)),
            ],
          ),
          CustomBottomSheet(
            scrollController: scrollController,
            maxSize: .8,
            minSize: .3,
            initSize: .5,
            bgcolor: MyColors.myGreyLight.withOpacity(.5),
            screen: (context, controller) => PlaylistList(
              playlistModel: widget.model,
              scrollController: controller,
            ),
          ),
        ],
      ),
    );
  }

  void changeSize() {
    setState(() {
      height = scrollController.size;
    });
    // log(height.toString());
  }
}
