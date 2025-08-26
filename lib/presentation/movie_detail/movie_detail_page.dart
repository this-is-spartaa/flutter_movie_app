import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/widgets/movie_detail_box_office.dart';
import 'package:flutter_movie_app/presentation/movie_detail/widgets/movie_detail_companies.dart';
import 'package:flutter_movie_app/presentation/movie_detail/widgets/movie_detail_genres.dart';
import 'package:flutter_movie_app/presentation/movie_detail/widgets/movie_detail_title_and_release.dart';
import 'package:flutter_movie_app/presentation/movie_detail/widgets/movie_overview.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_image.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    super.key,
    required this.heroTag,
    required this.posterPath,
    required this.id,
  });

  // HomePage 에서 터치한 영화와 동일한 tag를 사용해야해서
  // 속성으로 정의 후 생성자를 통해 전달
  final String heroTag;
  final String posterPath;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MovieImage(imgUrl: posterPath, heroTag: heroTag),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ********** 기본정보 **********
                MovieDetailBasicInfo(id: id),
                const Divider(),
                // ********** 장르 **********
                MovieDetailGenres(id: id),
                const Divider(),
                // ********** 영화요약 **********
                MovieOverview(id: id),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
                  '흥행정보',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                // ********** 흥행정보 **********
                MovieDetailBoxOffice(id: id),
                const SizedBox(height: 20),
                // ********** 제작사 **********
                MovieDetailCompanies(id: id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
