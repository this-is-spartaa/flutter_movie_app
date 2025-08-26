import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieOverview extends ConsumerWidget {
  /// 영화요약
  const MovieOverview({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModel(id));
    return Text(movieDetail?.overview ?? '');
  }
}
