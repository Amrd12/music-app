import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/data/models/artist_model.dart';
import 'package:musicapp/ui/screens/artist_screen/cubit/artist_cubit.dart';
import 'package:musicapp/ui/screens/artist_screen/widgets/artist_body.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key, required this.model});
  final ArtistModel model;

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  late ArtistModel model = widget.model;

  @override
  void initState() {
    BlocProvider.of<ArtistCubit>(context).getArtistInfo(widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistCubit, ArtistState>(
      builder: (context, state) {
        if (state is ArtistLoad) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ArtistError) {
          return Center(child: Text(state.error));
        }
        {
          if (state is ArtistSuccess) model = state.artistModel;
        }
        return ArtistBody(model: model);
      },
    );
  }
}
