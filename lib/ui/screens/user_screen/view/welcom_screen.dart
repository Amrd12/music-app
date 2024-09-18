import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/user_model.dart';
import 'package:musicapp/enums/user_icons.dart';
import 'package:musicapp/ui/screens/user_screen/cubit/user_cubit.dart';
import 'package:musicapp/ui/screens/user_screen/widgets/first_welcome.dart';
import 'package:musicapp/ui/screens/user_screen/widgets/last_welcome.dart';

import 'package:musicapp/ui/screens/user_screen/widgets/select_pic_widget.dart';
import 'package:musicapp/ui/screens/user_screen/widgets/user_name_widget.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  late PageController _controller;
  int page = 0;
  late ValueNotifier<String> name;
  @override
  void initState() {
    _controller = PageController();
    name = ValueNotifier<String>(buttonText());
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    _controller.dispose();
    super.dispose();
  }

  final list = [
    const FirstWelcome(),
    const UserNameWidget(),
    const SelectPicWidget(),
    const LastWelcome()
  ];
  UserModel user = UserModel(name: "", pic: "");

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        onPageChanged: (value) {
          page = value;
          name.value = buttonText();
        },
        controller: _controller,
        children: list,
      ),
      Container(
        alignment: const Alignment(0, .9),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () => _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut),
                icon: const Icon(Icons.keyboard_arrow_left_outlined)),
            SmoothPageIndicator(
              controller: _controller,
              count: list.length,
              onDotClicked: (index) => goPage(index),
            ),
            IconButton(
                onPressed: () => _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut),
                icon: const Icon(Icons.keyboard_arrow_right_outlined))
          ],
        ),
      ),
      Container(
        alignment: const Alignment(0, .75),
        child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          if (state is CurrentUser) {
            user = state.user!;
          }
          return ValueListenableBuilder(
              valueListenable: name,
              builder: (context, value, child) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.myOrange.withOpacity(.6),
                    ),
                    onPressed: () => _onPress(),
                    child: Text(
                      value,
                      style: TextStyleManger.mainTextLexend.copyWith(
                        color: MyColors.myWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ));
              });
        }),
      )
    ]);
  }

  String buttonText() {
    switch (page) {
      case 0:
        return "Get Started";
      case 3:
        return "Finished";

      default:
        return "Next";
    }
  }

  void _onPress() {
    if (page < 3) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      return;
    }

    if (user.name.isEmpty || user.name == "") {
      goPage(1);
      _showSnackBar("Please Enter Valid Name");
      return;
    }
    if (user.pic.toUserIcon() == null) {
      goPage(2);
      _showSnackBar("Please Selext Valid Picture");
      return;
    }
    BlocProvider.of<UserCubit>(context).setUser();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyleManger.mainTextLexend.copyWith(
          color: MyColors.myWhite,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.red[900]!.withOpacity(.8),
    ));
  }

  void goPage(int page) => _controller.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
}
