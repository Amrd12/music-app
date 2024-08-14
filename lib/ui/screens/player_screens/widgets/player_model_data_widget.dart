import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';

class PlayerModelDataWidget extends StatelessWidget {
  const PlayerModelDataWidget({
    super.key,
    required this.model,
  });

  final MusicModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          width: 60,
          height: 60,
          child: CachedNetworkImage(imageUrl: model.thumbnail.first)),
      title: Text(
        model.title,
        style: TextStyleManger.secTextLexend,
        maxLines: 3,
        overflow: TextOverflow.clip,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
      ),
      subtitle: Text(model.author, style: TextStyleManger.secTextLexendgery),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              model.isInBox == true ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {},
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
        ],
      ),
    );
  }
}

// ListTile(
//         title: Text(
//           model!.title,
//           style: TextStyleManger.secTextLexend,
//           maxLines: 3,
//           overflow: TextOverflow.clip,
//           textDirection: TextDirection.ltr,
//           textAlign: TextAlign.start,
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//             Text(model?.author ?? "", style: TextStyleManger.secTextLexendgery),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Text(Duration(seconds: model!.startFrom!.round())
//                     .toString()
//                     .split('.')[0]),
//                 Expanded(
//                   child: Slider(
//                     value: model!.startFrom,
//                     min: 0,
//                     max: (model!.seceunds ?? 0),
//                     onChanged: (sec) =>
//                         BlocProvider.of<PlayerMiniCubit>(context)
//                             .setCuruntValue(sec),
//                     activeColor: MyColors.myOrange,
//                     secondaryActiveColor: MyColors.myOrange,
//                   ),
//                 ),
//                 Text(Duration(seconds: model!.seceunds!.round())
//                     .toString()
//                     .split('.')[0])
//               ],
//             )
//           ],
//         ),
//       ),
 