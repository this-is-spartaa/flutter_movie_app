import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.imgUrl, required this.heroTag});
  final String imgUrl;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(imgUrl, fit: BoxFit.cover),
      ),
    );
  }
}
