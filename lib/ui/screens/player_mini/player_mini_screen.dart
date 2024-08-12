import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/music_model.dart';
import 'package:musicapp/ui/screens/player_mini/cubit/player_mini_cubit.dart';

class PlayerMiniScreen extends StatelessWidget {
  PlayerMiniScreen({super.key});
  MusicModel? model;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerMiniCubit, PlayerMiniState>(
      builder: (context, state) {
        if (state is PlayerMiniLoad) {
          model = state.model;
          print(model!.title);
          visible = state.visible;
          print(visible);
          print("model Tsec ${model!.seceunds}");
        }
        if (state is PlayerMiniSecounds && model != null) {
          model!.startFrom = state.sec;
        }
        return visible
            ? Container(
                decoration: const BoxDecoration(
                    color: MyColors.myGreyHeavy,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: double.maxFinite,
                child: ListTile(
                  title: Text(
                    model!.title,
                    style: TextStyleManger.secTextLexend,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(model!.author,
                          style: TextStyleManger.secTextLexendgery),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(Duration(seconds: model!.startFrom!.round())
                              .toString()
                              .split('.')[0]),
                          Expanded(
                            child: Slider(
                              value: model!.startFrom,
                              min: 0,
                              max: (model!.seceunds ?? 0),
                              onChanged: (sec) =>
                                  BlocProvider.of<PlayerMiniCubit>(context)
                                      .setCuruntValue(sec),
                              activeColor: MyColors.myOrange,
                              secondaryActiveColor: MyColors.myOrange,
                            ),
                          ),
                          Text(Duration(seconds: model!.seceunds!.round())
                              .toString()
                              .split('.')[0])
                        ],
                      )
                    ],
                  ),
                ),
              )
            : SizedBox.shrink();
      },
    );
  }
}
