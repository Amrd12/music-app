
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/enums/user_icons.dart';
import 'package:musicapp/ui/screens/user_screen/cubit/user_cubit.dart';

class SelectPicWidget extends StatefulWidget {
  const SelectPicWidget({super.key, this.button});
  final Widget? button;
  @override
  State<SelectPicWidget> createState() => _SelectPicWidgetState();
}

class _SelectPicWidgetState extends State<SelectPicWidget> {
  UserIcons currenticon = UserIcons.userIcon1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose Picture Icon",
              style: TextStyleManger.mainTextLexend.copyWith(
                fontSize: 20,
                color: MyColors.myWhite,
              ),
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is CurrentUser) {
                  currenticon = state.user!.pic.toUserIcon() ?? currenticon;
                  // log(currenticon.name + " \n" + state.user.toString());
                }
                return Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SvgPicture.asset(
                      currenticon.path,
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              },
            ),
            Flexible(
              child: GridView.builder(
                itemCount: UserIcons.values.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  final icon = UserIcons.values[index];
                  return IconButton(
                    onPressed: () =>
                        BlocProvider.of<UserCubit>(context).setPic(icon),
                    icon: SvgPicture.asset(
                      icon.path,
                      width: 100,
                      height: 100,
                    ),
                  );
                },
              ),
            ),
            if (widget.button != null) widget.button!,
          ],
        ),
      ),
    );
  }
}
