import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(imgUrl, fit: BoxFit.cover),
    );
  }
}
