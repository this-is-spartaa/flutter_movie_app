import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailCompanies extends ConsumerWidget {
  /// 제작사
  const MovieDetailCompanies({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetail = ref.watch(movieDetailViewModel(id));
    final companyLogos = movieDetail?.productionCompanyLogos ?? [];
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: companyLogos.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white.withOpacity(0.9),
            padding: const EdgeInsets.all(20),
            child: Image.network(companyLogos[index]),
          );
        },
      ),
    );
  }
}
