import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/ui/main_widgets/custom_bottom_sheet.dart';
import 'package:musicapp/ui/screens/artist_screen/widgets/artist_info_full.dart';
import 'package:musicapp/ui/screens/artist_screen/widgets/artist_info_mini.dart';
import 'package:musicapp/ui/screens/artist_screen/widgets/artist_scroll_screen.dart';

class ArtistBody extends StatefulWidget {
  const ArtistBody({super.key, required this.model});

  final ArtistModel model;

  @override
  State<ArtistBody> createState() => _ArtistBodyState();
}

class _ArtistBodyState extends State<ArtistBody> {
  double height = 0;
  double get screenHeight => MediaQuery.of(context).size.height;
  late DraggableScrollableController _controller;

  @override
  void initState() {
    _controller = DraggableScrollableController();
    super.initState();
    _controller.addListener(sizeChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(.6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBlack,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                // Flexible(child: _Screen(height: (1 - height))),
                if (height >= .65)
                  Flexible(   
                      child: ArtistInfoMini(
                          model: widget.model, height: (1 - height))),
                if (height < .65)
                  Flexible(
                      child: ArtistInfoFull(
                          model: widget.model, height: (1 - height))),
                SizedBox(
                  height: height * screenHeight,
                )
              ],
            ),
            CustomBottomSheet(
              bgcolor: MyColors.myGreyHeavy,
              scrollController: _controller,
              maxSize: .8,
              minSize: .5,
              initSize: .5,
              screen: (_, scroll) => ArtistScrollScreen(
                scroll: scroll,
                model: widget.model,
              ),
            )
          ],
        ),
      ),
    );
  }

  void sizeChange() {
    setState(() {
      height = _controller.size;
    });
  }
}
