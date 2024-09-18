import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/imgs_constance.dart';
import 'package:musicapp/constans/text_style_manager.dart';

class FirstWelcome extends StatelessWidget {
  const FirstWelcome({super.key});
  @override
  Widget build(BuildContext context) {
    double heigt = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            SvgPicture.asset(
              ImgsConstance.welcomeImage,
              colorFilter: ColorFilter.mode(
                  MyColors.myGreyLight.withOpacity(.8), BlendMode.srcIn),
            ),
            SizedBox(
              width: width,
              height: .85 * heigt,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "welcome To  Musicly",
                          textAlign: TextAlign.start,
                          style: TextStyleManger.mainTextLexend.copyWith(
                              color: MyColors.myOrange,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Your music playerapp",
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: TextStyleManger.mainTextLexend.copyWith(
                              color: MyColors.myWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
