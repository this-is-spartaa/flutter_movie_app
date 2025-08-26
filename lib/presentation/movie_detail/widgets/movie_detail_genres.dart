import 'package:flutter/material.dart';

class MovieDetailGenres extends StatelessWidget {
  /// 장르
  const MovieDetailGenres({super.key});

  @override
  Widget build(BuildContext context) {
    final genres = ['Animation', 'Adventure', 'Family', 'Comedy'];
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.center,
            child: Text(
              genres[index],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
