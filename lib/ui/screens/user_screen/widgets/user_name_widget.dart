
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/ui/screens/user_screen/cubit/user_cubit.dart';

class UserNameWidget extends StatefulWidget {
  const UserNameWidget({super.key});

  @override
  State<UserNameWidget> createState() => _UserNameWidgetState();
}

class _UserNameWidgetState extends State<UserNameWidget> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heigt = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        alignment: Alignment(0, -.4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "set your name",
              style: TextStyleManger.mainTextLexend,
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is CurrentUser) {
                  _controller.text = state.user!.name;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextField(
                    onChanged: (value) =>
                        BlocProvider.of<UserCubit>(context).setName(value),
                    controller: _controller,
                    style: TextStyleManger.mainTextLexend.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 10,
                    ),
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
