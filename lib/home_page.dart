import 'package:flutter/material.dart';
import 'package:flutter_movie_app/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(homeViewModel).nowPlayingMovies ?? [];
    return Scaffold(
      body: ListView(
        children: [
          Text(
            '현재 상영중',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 180,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(movie.posterPath, fit: BoxFit.cover),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
