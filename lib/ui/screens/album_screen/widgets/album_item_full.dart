import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/screens/album_screen/widgets/custom_album_photo.dart';

class AlbumItemFull extends StatefulWidget {
  const AlbumItemFull({super.key, required this.model, required this.size});
  final double size;
  final AlbumModel model;

  @override
  State<AlbumItemFull> createState() => _AlbumItemFullState();
}

class _AlbumItemFullState extends State<AlbumItemFull> {
  @override
  Widget build(BuildContext context) {
    final double he = MediaQuery.of(context).size.height;
    return SizedBox(
      height: he * widget.size,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: he * widget.size * .6,
              child: CustomAlbumPhoto(model: widget.model)),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.model.title,
                  style: TextStyleManger.mainTextLexend
                      .copyWith(color: MyColors.myOrange, fontSize: 20)),
              Text(widget.model.albumAuthor ?? "",
                  style: TextStyleManger.secTextLexend.copyWith(fontSize: 15)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Top Songs"),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ],
          ),
        ],
      ),
    );
  }
}
