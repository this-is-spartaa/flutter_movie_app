import 'package:flutter/material.dart';

class MovieDetailCompanies extends StatelessWidget {
  /// 제작사
  const MovieDetailCompanies({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white.withOpacity(0.9),
            padding: const EdgeInsets.all(20),
            child: Image.network('https://picsum.photos/300/200'),
          );
        },
      ),
    );
  }
}
