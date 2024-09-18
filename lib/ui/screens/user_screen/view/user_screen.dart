import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/ui/main_widgets/custom_bottom_sheet.dart';
import 'package:musicapp/ui/screens/user_screen/cubit/user_cubit.dart';
import 'package:musicapp/ui/screens/user_screen/widgets/last_welcome.dart';
import 'package:musicapp/ui/screens/user_screen/widgets/scroll_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late DraggableScrollableController _controller;
  @override
  void initState() {
    _controller = DraggableScrollableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heigt = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(children: [
        Container(
          alignment: const Alignment(.95, -.95),
          child: IconButton(
            onPressed: () => BlocProvider.of<UserCubit>(context).delUser(),
            icon: const Icon(Icons.logout),
          ),
        ),
        SizedBox(
          width: width,
          height: heigt,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              LastWelcome(),
            ],
          ),
        ),
        CustomBottomSheet(
            scrollController: _controller,
            maxSize: .6,
            minSize: .2,
            initSize: .5,
            screen: (context, controller) => const ScrollScreen())
      ]),
    );
  }
}
