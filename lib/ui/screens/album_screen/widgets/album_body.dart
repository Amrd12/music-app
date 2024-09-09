import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/main_widgets/custom_bottom_sheet.dart';
import 'package:musicapp/ui/screens/album_screen/widgets/album_item_full.dart';
import 'package:musicapp/ui/screens/album_screen/widgets/album_item_mini.dart';
import 'package:musicapp/ui/screens/album_screen/widgets/album_list.dart';

class AlbumBody extends StatefulWidget {
  const AlbumBody({super.key, required this.model});
  final AlbumModel model;

  @override
  State<AlbumBody> createState() => _AlbumBodyState();
}

class _AlbumBodyState extends State<AlbumBody> {
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
    scrollController.dispose();
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
                AlbumItemFull(model: widget.model, size: (1 - height)),
              if (height >= .61)
                SizedBox(
                  height: (1 - height) * MediaQuery.of(context).size.height,
                  child: AlbumItemMini(model: widget.model),
                ),
            ],
          ),
          CustomBottomSheet(
            scrollController: scrollController,
            maxSize: .8,
            minSize: .3,
            initSize: .5,
            bgcolor: MyColors.myGreyLight.withOpacity(.5),
            screen: (context, controller) => AlbumList(
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
