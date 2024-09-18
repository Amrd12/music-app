import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/user_model.dart';
import 'package:musicapp/enums/user_icons.dart';
import 'package:musicapp/ui/screens/user_screen/cubit/user_cubit.dart';

class LastWelcome extends StatelessWidget {
  const LastWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = UserModel(name: "", pic: "");
    return SafeArea(child: BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is CurrentUser) {
          user = state.user!;
        }

        return Column(
          
          children: [
            if (user.pic != "")
              SvgPicture.asset(
                user.pic.toUserIcon()!.path,
                width: 150,
                height: 150,
              ),
            const Text(
              "Hi welcome",
              style: TextStyleManger.mainTextLexend,
            ),
            Text(user.name,
                style: TextStyleManger.mainTextNico.copyWith(
                  color: MyColors.myOrange,
                  fontSize: 35,
                )),
          ],
        );
      },
    ));
  }
}
