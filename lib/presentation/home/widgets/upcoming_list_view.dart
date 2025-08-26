import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/home/home_view_model.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpcomingListView extends ConsumerWidget {
  const UpcomingListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(homeViewModel).upcomingMovies ?? [];
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          // Hero 위젯의 tag 속성은 같은 페이지 내에서 중복되면 안됨!
          final heroTag = "upcoming-$index";
          final movie = movies[index];
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
            child: MovieImage(imgUrl: movie.posterPath, heroTag: heroTag),
          );
        },
      ),
    );
  }
}
