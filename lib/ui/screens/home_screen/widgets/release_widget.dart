import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/strings.dart';
import 'package:musicapp/constans/themedata.dart';

class ReleaseWidget extends StatelessWidget {
  const ReleaseWidget(
      {super.key,
      required this.songName,
      required this.author,
      required this.picLink});
  final String songName, author, picLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 40),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: MyColors.myOrange),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(picLink, fit: BoxFit.cover)),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.7),
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        child: const Icon(Icons.play_arrow, size: 40)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(songName, style: Theme.of(context).textTheme.titleLarge),
                  Text(author, style: Theme.of(context).textTheme.titleMedium)
                ],
              )
            ],
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
