import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/data/models/search_model.dart';
import 'package:musicapp/enums/model_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/ui/main_widgets/custom_push_screen.dart';
import 'package:musicapp/ui/screens/search_screen/cubit/search_cubit.dart';
import 'package:musicapp/ui/screens/search_screen/widgets/search_history_widget.dart';
import 'package:musicapp/ui/screens/search_screen/widgets/search_result_Widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchModel currentItem;
  late TextEditingController _controller;

  late ValueNotifier<bool> showHistory;

  ModelType? searchtype;

  @override
  void initState() {
    _controller = TextEditingController();
    currentItem = SearchModel(querry: "", type: ModelType.music.toString());
    showHistory = ValueNotifier<bool>(true);
    BlocProvider.of<SearchCubit>(context).loadLocal();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(currentItem.toString());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchItem) {
                  currentItem = state.model;
                }
                _controller.text = currentItem.querry;

                return TextField(
                  onSubmitted: (value) => _search(),
                  textInputAction: TextInputAction.search,
                  onChanged: (value) =>
                      currentItem = currentItem.copyWith(querry: value),
                  controller: _controller,
                  decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            color: MyColors.myWhite,
                            onPressed: () => _iconbuttonOnpress(),
                            icon: SvgPicture.asset(
                              currentItem.type.toModelType()!.icon(),
                              colorFilter: const ColorFilter.mode(
                                  MyColors.myWhite, BlendMode.srcIn),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _search(),
                            icon: const Icon(Icons.search),
                          )
                        ],
                      ),
                      labelText: "Querry",
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                );
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder<bool>(
                valueListenable: showHistory,
                builder: (BuildContext context, bool value, Widget? child) {
                  return value
                      ? const SearchHistoryWidget()
                      : SearchResultWidget(
                          model: currentItem, close: showHistory);
                },
              ),
            )
          ],
        ),
      )),
    );
  }

  void _search() {
    log(currentItem.toString());
    showHistory.value = false;
    BlocProvider.of<SearchCubit>(context).search(currentItem);

    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (_) =>
    //         CustomPushScreen(screen: SearchResultWidget(model: currentItem))));
  }

  void _iconbuttonOnpress() {
    ModelType currentType = currentItem.type.toModelType() ?? ModelType.music;
    ModelType nextType = getNextType(currentType);
    BlocProvider.of<SearchCubit>(context)
        .setItem(currentItem.copyWith(type: nextType.toString()));
  }

  ModelType getNextType(ModelType currentType) {
    List<ModelType> types = ModelType.values;

    // Find the next item using firstWhere
    ModelType nextType = types.firstWhere(
      (type) => type.index == (currentType.index + 1) % types.length,
      orElse: () => ModelType.music, // Fallback in case something goes wrong
    );
    return nextType;
  }
}
