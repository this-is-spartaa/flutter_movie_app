import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_image.dart';

class MostPopularMovie extends StatelessWidget {
  const MostPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    // Hero 위젯의 tag 속성은 같은 페이지 내에서 중복되면 안됨!
    final heroTag = "most-popular";
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(heroTag: heroTag),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MovieImage(
          imgUrl: 'https://picsum.photos/200/300',
          heroTag: heroTag,
        ),
      ),
    );
  }
}
