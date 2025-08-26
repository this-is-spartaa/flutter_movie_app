import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/home/widgets/home_label.dart';
import 'package:flutter_movie_app/presentation/home/widgets/most_popular_movie.dart';
import 'package:flutter_movie_app/presentation/home/widgets/now_playing_list_view.dart';
import 'package:flutter_movie_app/presentation/home/widgets/popular_list_view.dart';
import 'package:flutter_movie_app/presentation/home/widgets/top_rated_list_view.dart';
import 'package:flutter_movie_app/presentation/home/widgets/upcoming_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeLabel(label: '가장 인기있는'),
          MostPopularMovie(),
          const HomeLabel(label: '현재 상영중'),
          const NowPlayingListView(),
          const HomeLabel(label: '인기순'),
          const PopularListView(),
          const HomeLabel(label: '평점 높은순'),
          const TopRatedListView(),
          const HomeLabel(label: '개봉예정'),
          const UpcomingListView(),
        ],
      ),
    );
  }
}
