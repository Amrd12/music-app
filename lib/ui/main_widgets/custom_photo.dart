import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto(
      {super.key,
      required this.imageUrl,
      required this.radius,
      this.padding = 0.0,
      this.margain = 0.0});

  final String imageUrl;
  final double radius, padding, margain;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margain),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
    );
  }
}
