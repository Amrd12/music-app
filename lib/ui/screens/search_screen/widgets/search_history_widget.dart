import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/constans/text_style_manager.dart';
import 'package:musicapp/data/models/search_model.dart';
import 'package:musicapp/enums/model_type.dart';
import 'package:musicapp/ui/screens/search_screen/cubit/search_cubit.dart';

class SearchHistoryWidget extends StatefulWidget {
  const SearchHistoryWidget({super.key});

  @override
  State<SearchHistoryWidget> createState() => _SearchHistoryWidgetState();
}

class _SearchHistoryWidgetState extends State<SearchHistoryWidget> {
  List<SearchModel> history = [];
  ModelType? selectedType;

  @override
  void initState() {
    _filterOnPress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLocal) {
          history = state.modelList;
          selectedType = state.filterType;
        }

        return Column(
          children: [
            // Row for filter buttons
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => _filterOnPress(),
                  icon: const Icon(Icons.not_interested),
                  color: selectedType == null
                      ? MyColors.myOrange
                      : MyColors.myWhite,
                ),
                ...ModelType.values.map((e) {
                  return IconButton(
                    onPressed: () => _filterOnPress(type: e),
                    icon: SvgPicture.asset(
                      e.icon(),
                      colorFilter: ColorFilter.mode(
                        e == selectedType
                            ? MyColors.myOrange
                            : MyColors.myWhite,
                        BlendMode.srcIn,
                      ),
                    ),
                  );
                }),
              ],
            ),
            // ListView for search history
            Expanded(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    _swipe(true); // Swipe right
                  } else if (details.primaryVelocity! > 0) {
                    _swipe(false); // Swipe left
                  }
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    final modelIndex = history[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.only(left: 10),
                      onTap: () => BlocProvider.of<SearchCubit>(context)
                          .setItem(modelIndex),
                      leading: SvgPicture.asset(
                        modelIndex.type.toModelType()!.icon(),
                        colorFilter: const ColorFilter.mode(
                            MyColors.myWhite, BlendMode.srcIn),
                      ),
                      title: Text(
                        modelIndex.querry,
                        style: TextStyleManger.mainTextNico
                            .copyWith(fontSize: 25, color: MyColors.myOrange),
                      ),
                      subtitle: Text(
                        modelIndex.date,
                        style: TextStyleManger.mainTextLexend.copyWith(
                          fontSize: 15,
                          color: MyColors.myWhite,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () => BlocProvider.of<SearchCubit>(context)
                              .deleteModel(modelIndex),
                          icon: const Icon(Icons.delete)),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Padding(padding: EdgeInsets.only(right: 10)),
                  itemCount: history.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Handle swipe to update search type
  void _swipe(bool right) {
    if (selectedType == null && right) {
      selectedType = ModelType.values.first;
    } else if (right) {
      selectedType = selectedType != ModelType.values.last
          ? getNextType(selectedType!)
          : ModelType.values.first;
    } else {
      selectedType = selectedType == ModelType.values.first
          ? null
          : getPrevType(selectedType!);
    }

    // Trigger filter search based on new type
    BlocProvider.of<SearchCubit>(context).filterSearch(type: selectedType);
  }

  // Get the next ModelType
  ModelType getNextType(ModelType currentType) {
    List<ModelType> types = ModelType.values;
    return types[(currentType.index + 1) % types.length];
  }

  // Get the previous ModelType
  ModelType getPrevType(ModelType currentType) {
    List<ModelType> types = ModelType.values;
    return types[(currentType.index - 1 + types.length) % types.length];
  }

  // Handle filter button press
  void _filterOnPress({ModelType? type}) {
    BlocProvider.of<SearchCubit>(context).filterSearch(type: type);
  }
}
