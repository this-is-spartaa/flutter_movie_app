import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchMovieDetailUsecase extends Mock
    implements FetchMovieDetailUsecase {}

void main() {
  ProviderContainer? providerContainer;

  setUp(() {
    final fetchMoviesUsecaseProviderOverride = fetchMovieDetailUsecaseProvider
        .overrideWith((ref) => MockFetchMovieDetailUsecase());
    providerContainer = ProviderContainer(
      overrides: [fetchMoviesUsecaseProviderOverride],
    );
    addTearDown(providerContainer!.dispose);
  });

  test('MovieDetailViewModel test : state update after fetchAll', () async {
    when(
      () => providerContainer!
          .read(fetchMovieDetailUsecaseProvider)
          .execute(any()),
    ).thenAnswer(
      (_) async => MovieDetail(
        id: 1,
        budget: 100,
        genres: ['액션'],
        productionCompanyLogos: [],
        overview: 'overview',
        popularity: 222,
        releaseDate: DateTime(2024, 1, 1),
        revenue: 111,
        runtime: 222,
        tagline: 'tagline',
        title: 'title',
        voteAverage: 333,
        voteCount: 777,
      ),
    );

    final stateBefore = providerContainer!.read(movieDetailViewModel(1));
    expect(stateBefore, isNull);

    await providerContainer!
        .read(movieDetailViewModel(1).notifier)
        .fetchDetail();

    final stateAfter = providerContainer!.read(movieDetailViewModel(1));
    expect(stateAfter!.id, 1);
  });
}
