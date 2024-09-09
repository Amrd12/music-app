import 'package:flutter/material.dart';
import 'package:musicapp/data/models/artist_model.dart';

class ArtistBody extends StatefulWidget {
  const ArtistBody({super.key, required this.model});
  final ArtistModel model;
  @override
  State<ArtistBody> createState() => _ArtistBodyState();
}

class _ArtistBodyState extends State<ArtistBody> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  
}
