import 'package:flutter_movie_app/movie.dart';
import 'package:flutter_movie_app/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final List<Movie>? nowPlayingMovies;

  HomeState({required this.nowPlayingMovies});
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    fetchAll();
    return HomeState(nowPlayingMovies: null);
  }

  Future<void> fetchAll() async {
    final nowPlaying =
        await ref.read(fetchNowPlayingMoviesUsecaseProvider).execute();

    state = HomeState(nowPlayingMovies: nowPlaying);
  }
}

final homeViewModel = NotifierProvider<HomeViewModel, HomeState>(
  () => HomeViewModel(),
);
