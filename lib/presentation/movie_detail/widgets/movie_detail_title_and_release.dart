import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailBasicInfo extends ConsumerWidget {
  /// 기본정보
  const MovieDetailBasicInfo({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModel(id));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 가로 좌측 정렬
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              movieDetail?.title ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              movieDetail == null
                  ? ''
                  : '${movieDetail.releaseDate.year}-${movieDetail.releaseDate.month}-${movieDetail.releaseDate.day}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(movieDetail?.tagline ?? ''),
        Text(
          movieDetail?.runtime == null ? '' : '${movieDetail!.runtime}분',
        ), // runtime
      ],
    );
  }
}
