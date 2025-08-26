import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:flutter_movie_app/presentation/home/home_view_model.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchNowPlayingMoviesUsecase extends Mock
    implements FetchNowPlayingMoviesUsecase {}

class MockFetchPopularMoviesUsecase extends Mock
    implements FetchPopularMoviesUsecase {}

class MockFetchTopRatedMoviesUsecase extends Mock
    implements FetchTopRatedMoviesUsecase {}

class MockFetchUpcomingMoviesUsecase extends Mock
    implements FetchUpcomingMoviesUsecase {}

void main() {
  ProviderContainer? providerContainer;

  setUp(() {
    final fetchMoviesUsecaseProviderOverride =
        fetchNowPlayingMoviesUsecaseProvider.overrideWith(
          (ref) => MockFetchNowPlayingMoviesUsecase(),
        );
    final fetchPopularMoviesUsecaseProviderOverride =
        fetchPopularMoviesUsecaseProvider.overrideWith(
          (ref) => MockFetchPopularMoviesUsecase(),
        );
    final fetchTopRatedMoviesUsecaseProviderOverride =
        fetchTopRatedMoviesUsecaseProvider.overrideWith(
          (ref) => MockFetchTopRatedMoviesUsecase(),
        );
    final fetchUpcomingMoviesUsecaseProviderOverride =
        fetchUpcomingMoviesUsecaseProvider.overrideWith(
          (ref) => MockFetchUpcomingMoviesUsecase(),
        );
    providerContainer = ProviderContainer(
      overrides: [
        fetchMoviesUsecaseProviderOverride,
        fetchPopularMoviesUsecaseProviderOverride,
        fetchTopRatedMoviesUsecaseProviderOverride,
        fetchUpcomingMoviesUsecaseProviderOverride,
      ],
    );
    addTearDown(providerContainer!.dispose);
  });

  test('HomeViewModel test : state update after fetchAll', () async {
    when(
      () =>
          providerContainer!
              .read(fetchNowPlayingMoviesUsecaseProvider)
              .execute(),
    ).thenAnswer(
      (_) async => [Movie(id: 1, posterPath: 'http://test.com/image1.jpg')],
    );
    when(
      () =>
          providerContainer!.read(fetchPopularMoviesUsecaseProvider).execute(1),
    ).thenAnswer(
      (_) async => [Movie(id: 2, posterPath: 'http://test.com/image2.jpg')],
    );
    when(
      () =>
          providerContainer!.read(fetchTopRatedMoviesUsecaseProvider).execute(),
    ).thenAnswer(
      (_) async => [Movie(id: 3, posterPath: 'http://test.com/image3.jpg')],
    );
    when(
      () =>
          providerContainer!.read(fetchUpcomingMoviesUsecaseProvider).execute(),
    ).thenAnswer(
      (_) async => [Movie(id: 4, posterPath: 'http://test.com/image4.jpg')],
    );

    // 1. 최초상태 Null
    final stateBefore = providerContainer!.read(homeViewModel);
    expect(stateBefore.mostPopular, isNull);
    expect(stateBefore.nowPlayingMovies, isNull);
    expect(stateBefore.popularMovies, isNull);
    expect(stateBefore.topRatedMovies, isNull);
    expect(stateBefore.upcomingMovies, isNull);

    // 2. fetchMovie 호출한 뒤 => 상태 사이즈 1
    await providerContainer!.read(homeViewModel.notifier).fetchAll();

    final stateAfter = providerContainer!.read(homeViewModel);
    expect(stateAfter.mostPopular!.id, 2);
    expect(stateAfter.nowPlayingMovies!.first.id, 1);
    expect(stateAfter.popularMovies!.first.id, 2);
    expect(stateAfter.topRatedMovies!.first.id, 3);
    expect(stateAfter.upcomingMovies!.first.id, 4);
  });
}
