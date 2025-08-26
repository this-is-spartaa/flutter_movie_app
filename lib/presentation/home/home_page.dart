import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/home/home_view_model.dart';
import 'package:flutter_movie_app/presentation/home/widgets/home_label.dart';
import 'package:flutter_movie_app/presentation/home/widgets/most_popular_movie.dart';
import 'package:flutter_movie_app/presentation/home/widgets/now_playing_list_view.dart';
import 'package:flutter_movie_app/presentation/home/widgets/popular_list_view.dart';
import 'package:flutter_movie_app/presentation/home/widgets/top_rated_list_view.dart';
import 'package:flutter_movie_app/presentation/home/widgets/upcoming_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RefreshIndicator(
        // Future 를 반환하는 함수!
        // RefreshIndicator는 onRefresh 함수를 호출하고
        // 끝날때까지 로딩 애니메이션 보여줌
        onRefresh: () async{
          // 데이터 불러오는 시간이 너무 짧으면 사용자가 새로고침 애니메이션을 못봐서
          // 새로고침 되는지 모르게 되는 경우 방지
          await Future.delayed(Duration(milliseconds: 1500));
          await ref.read(homeViewModel.notifier).fetchAll();
        },
        child: ListView(
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
      ),
    );
  }
}
