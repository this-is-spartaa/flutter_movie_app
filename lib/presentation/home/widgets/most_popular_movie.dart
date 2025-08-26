import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_image.dart';

class MostPopularMovie extends StatelessWidget {
  const MostPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MovieImage(imgUrl: 'https://picsum.photos/200/300'),
      ),
    );
  }
}
