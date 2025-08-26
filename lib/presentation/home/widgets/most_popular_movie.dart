import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/home/home_view_model.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MostPopularMovie extends ConsumerWidget {
  const MostPopularMovie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(homeViewModel).mostPopular;
    if (movie == null) {
      return SizedBox();
    }

    // Hero 위젯의 tag 속성은 같은 페이지 내에서 중복되면 안됨!
    final heroTag = "most-popular";
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => MovieDetailPage(
                  heroTag: heroTag,
                  posterPath: movie.posterPath,
                  id: movie.id,
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MovieImage(imgUrl: movie.posterPath, heroTag: heroTag),
      ),
    );
  }
}
