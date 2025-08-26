import 'dart:convert';

import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto/production_company.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart/movie_response_dto.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'samples/sample_test_helper.dart';

class MockMovieDataSource extends Mock implements MovieDataSource {}

void main() {
  MockMovieDataSource? mockMovieDataSource;
  MovieRepositoryImpl? movieRepositoryImpl;

  SampleTestHelper? helper;

  setUp(() async {
    mockMovieDataSource = MockMovieDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieDataSource!);
    helper = SampleTestHelper();
    await helper!.loadFixture();
  });

  test('MovieRepositoryImpl : fetchNowPlayingMovies test', () async {
    when(() => mockMovieDataSource!.fetchNowPlayingMovies()).thenAnswer(
      (_) async =>
          MovieResponseDto.fromJson(jsonDecode(helper!.nowPlayingSample)),
    );

    final movies = await movieRepositoryImpl!.fetchNowPlayingMovies();
    expect(movies, isNotNull);
    expect(movies!.length, 20);
    for (var movie in movies) {
      expect(movie.posterPath.startsWith('http'), true);
    }
  });
  test('MovieRepositoryImpl : fetchPopularMovies test', () async {
    when(() => mockMovieDataSource!.fetchPopularMovies(1)).thenAnswer(
      (_) async => MovieResponseDto.fromJson(jsonDecode(helper!.popularSample)),
    );

    final movies = await movieRepositoryImpl!.fetchPopularMovies(1);
    expect(movies, isNotNull);
    expect(movies!.length, 20);
    for (var movie in movies) {
      expect(movie.posterPath.startsWith('http'), true);
    }
  });
  test('MovieRepositoryImpl : fetchTopRatedMovies test', () async {
    when(() => mockMovieDataSource!.fetchTopRatedMovies()).thenAnswer(
      (_) async =>
          MovieResponseDto.fromJson(jsonDecode(helper!.topRatedSample)),
    );

    final movies = await movieRepositoryImpl!.fetchTopRatedMovies();
    expect(movies, isNotNull);
    expect(movies!.length, 20);
    for (var movie in movies) {
      expect(movie.posterPath.startsWith('http'), true);
    }
  });
  test('MovieRepositoryImpl : fetchUpcomingMovies test', () async {
    when(() => mockMovieDataSource!.fetchUpcomingMovies()).thenAnswer(
      (_) async =>
          MovieResponseDto.fromJson(jsonDecode(helper!.upcomingSample)),
    );

    final movies = await movieRepositoryImpl!.fetchUpcomingMovies();
    expect(movies, isNotNull);
    expect(movies!.length, 20);
    for (var movie in movies) {
      expect(movie.posterPath.startsWith('http'), true);
    }
  });
  test('MovieRepositoryImpl : fetchMovieDetail test', () async {
    final dto = MovieDetailDto(
      adult: false,
      backdropPath: '4dRtXjk1rcsZlaMJpBn6Nh9cTfO.jpg',
      belongsToCollection: null,
      budget: 123,
      genres: [],
      homepage: '',
      id: 1,
      imdbId: '1',
      originCountry: ['originCountry'],
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1,
      posterPath: '/4dRtXjk1rcsZlaMJpBn6Nh9cTfO.jpg',
      productionCompanies: [
        ProductionCompany(
            id: 1,
            logoPath: '/4dRtXjk1rcsZlaMJpBn6Nh9cTfO.jpg',
            name: 'name',
            originCountry: 'originCountry')
      ],
      productionCountries: [],
      releaseDate: DateTime.now(),
      revenue: 1,
      runtime: 1,
      spokenLanguages: [],
      status: 'status',
      tagline: 'tagline',
      title: 'title',
      video: false,
      voteAverage: 1,
      voteCount: 1,
    );

    when(() => mockMovieDataSource!.fetchMovieDetail(any()))
        .thenAnswer((_) async => dto);

    final movieDetail = await movieRepositoryImpl!.fetchMovieDetail(1);
    expect(movieDetail, isNotNull);
    expect(movieDetail!.productionCompanyLogos.isEmpty, false);
    for (var logo in movieDetail.productionCompanyLogos) {
      expect(logo.startsWith('http'), true);
    }
  });
}
