import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailBoxOffice extends ConsumerWidget {
  /// 흥행정보
  const MovieDetailBoxOffice({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModel(id));
    // voteAverage, voteCount, revenue, popularity, budget
    final labels = ["평점", "평점투표수", "인기점수", "예산", "수익"];
    final values = [
      "${movieDetail?.voteAverage ?? ''}",
      "${movieDetail?.voteCount ?? ''}",
      "${movieDetail?.revenue ?? ''}",
      "${movieDetail?.popularity ?? ''}",
      "${movieDetail?.budget ?? ''}",
    ];
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(values[index]), //
                Text(labels[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
