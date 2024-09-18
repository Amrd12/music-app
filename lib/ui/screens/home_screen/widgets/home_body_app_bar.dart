import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/user_model.dart';
import 'package:musicapp/enums/user_icons.dart';
import 'package:musicapp/ui/screens/user_screen/cubit/user_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBodyAppBar extends StatefulWidget {
  const HomeBodyAppBar({
    super.key,
  });

  @override
  State<HomeBodyAppBar> createState() => _HomeBodyAppBarState();
}

class _HomeBodyAppBarState extends State<HomeBodyAppBar> {
  UserModel? user;
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is CurrentUser) {
          user = state.user;
        }
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello ${user!.name} !",
                style: TextStyleManger.mainTextNico,
              ),
              SvgPicture.asset(
                user!.pic.toUserIcon()!.path,
                width: 50,
                height: 50,
              )
            ]);
      },
    );
  }
}
