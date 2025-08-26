import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_image.dart';

class TopRatedListView extends StatelessWidget {
  const TopRatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MovieDetailPage()),
              );
            },
            child: MovieImage(imgUrl: 'https://picsum.photos/200/300'),
          );
        },
      ),
    );
  }
}
