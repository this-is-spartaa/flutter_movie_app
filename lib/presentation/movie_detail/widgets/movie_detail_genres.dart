import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailGenres extends ConsumerWidget {
  /// 장르
  const MovieDetailGenres({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModel(id));
    final genres = movieDetail?.genres ?? [];
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
