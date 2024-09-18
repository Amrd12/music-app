import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/album_model.dart';
import 'package:musicapp/ui/main_widgets/custom_photo.dart';
import 'package:musicapp/ui/main_widgets/custom_push_screen.dart';
import 'package:musicapp/ui/screens/album_screen/view/album_screen.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({super.key, required this.modelList, this.scroll});
  final List<AlbumModel> modelList;
  final ScrollController? scroll;

  @override
  Widget build(BuildContext context) {
    return modelList.isEmpty
        ? const Center(
            child: Text("Empty"),
          )
        : ListView.builder(
            itemCount: modelList.length,
            padding: const EdgeInsets.all(8.0),
            controller: scroll,
            itemBuilder: (context, index) {
              final model = modelList[index];
              return ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>
                        CustomPushScreen(screen: AlbumScreen(model: model)))),
                leading: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CustomPhoto(imageUrl: model.thumbnail, radius: 100),
                ),
                title: Text(
                  model.title,
                  maxLines: 1, // Ensures the title is only one line
                  overflow: TextOverflow.ellipsis, // Adds ellipsis if overflow
                  style: TextStyleManger.mainTextNico
                      .copyWith(fontSize: 18, color: MyColors.myOrange),
                ),
                minLeadingWidth: 20,
                subtitle: Text(
                  model.albumAuthor ?? model.albumDescription,
                  maxLines: 1, // Ensures the subtitle is only one line
                  overflow: TextOverflow.ellipsis, // Adds ellipsis if overflow
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style:
                      TextStyleManger.secTextLexendWhite.copyWith(fontSize: 15),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon:  Icon(model.isInBox? Icons.favorite : Icons.heart_broken_outlined
                    )),
              );
            },
          );
  }
}
