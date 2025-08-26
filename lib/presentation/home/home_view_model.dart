import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final Movie? mostPopular;
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? popularMovies;
  final List<Movie>? topRatedMovies;
  final List<Movie>? upcomingMovies;

  HomeState({
    required this.mostPopular,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    fetchAll();
    return HomeState(
      mostPopular: null,
      nowPlayingMovies: null,
      popularMovies: null,
      topRatedMovies: null,
      upcomingMovies: null,
    );
  }

  Future<void> fetchAll() async {
    _popularPage = 1;
    final nowPlaying =
        await ref.read(fetchNowPlayingMoviesUsecaseProvider).execute();
    final popular = await ref
        .read(fetchPopularMoviesUsecaseProvider)
        .execute(_popularPage);
    final topRated =
        await ref.read(fetchTopRatedMoviesUsecaseProvider).execute();
    final upcoming =
        await ref.read(fetchUpcomingMoviesUsecaseProvider).execute();

    state = HomeState(
      mostPopular: popular?.first,
      nowPlayingMovies: nowPlaying,
      popularMovies: popular,
      topRatedMovies: topRated,
      upcomingMovies: upcoming,
    );
  }

  /// 로딩중일 때 재 호출 방지용
  bool _isFetchingPopular = false;
  int _popularPage = 1;

  Future<void> fetchMorePopularMovies() async {
    if (_isFetchingPopular) {
      return;
    }
    _isFetchingPopular = true;
    _popularPage++;

    final result =
        await ref
            .read(fetchPopularMoviesUsecaseProvider)
            .execute(_popularPage) ??
        [];

    state = HomeState(
      mostPopular: state.mostPopular,
      nowPlayingMovies: state.nowPlayingMovies,
      popularMovies: [...state.popularMovies!, ...result],
      topRatedMovies: state.topRatedMovies,
      upcomingMovies: state.upcomingMovies,
    );

    _isFetchingPopular = false;
  }
}

final homeViewModel = NotifierProvider<HomeViewModel, HomeState>(
  () => HomeViewModel(),
);
