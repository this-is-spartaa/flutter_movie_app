import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/tmbd_movie_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'samples/sample_test_helper.dart';

class MockDio extends Mock implements Dio {
  @override
  Interceptors get interceptors => Interceptors();
}

void main() {
  MockDio? mockDio;
  TmbdMovieDataSourceImpl? tmbdMovieDataSourceImpl;

  SampleTestHelper? helper;

  setUp(() async {
    mockDio = MockDio();
    tmbdMovieDataSourceImpl = TmbdMovieDataSourceImpl(mockDio!);
    helper = SampleTestHelper();
    await helper!.loadFixture();
  });

  test('TmbdMovieDataSourceImpl : fetchNowPlayingMovies test', () async {
    when(() =>
            mockDio!.get(any(), options: any(named: 'options')))
        .thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: jsonDecode(helper!.nowPlayingSample),
      ),
    );

    final responseDto = await tmbdMovieDataSourceImpl!.fetchNowPlayingMovies();
    expect(responseDto, isNotNull);
    expect(responseDto!.results.length, 20);
  });
  test('TmbdMovieDataSourceImpl : fetchPopularMovies test', () async {
    when(() =>
            mockDio!.get(any(), options: any(named: 'options')))
        .thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: jsonDecode(helper!.popularSample),
      ),
    );

    final responseDto = await tmbdMovieDataSourceImpl!.fetchPopularMovies();
    expect(responseDto, isNotNull);
    expect(responseDto!.results.length, 20);
  });
  test('TmbdMovieDataSourceImpl : fetchTopRatedMovies test', () async {
    when(() =>
            mockDio!.get(any(), options: any(named: 'options')))
        .thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: jsonDecode(helper!.topRatedSample),
      ),
    );
    final responseDto = await tmbdMovieDataSourceImpl!.fetchTopRatedMovies();
    expect(responseDto, isNotNull);
    expect(responseDto!.results.length, 20);
  });
  test('TmbdMovieDataSourceImpl : fetchUpcomingMovies test', () async {
    when(() =>
            mockDio!.get(any(), options: any(named: 'options')))
        .thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: jsonDecode(helper!.upcomingSample),
      ),
    );
    final responseDto = await tmbdMovieDataSourceImpl!.fetchUpcomingMovies();
    expect(responseDto, isNotNull);
    expect(responseDto!.results.length, 20);
  });
  test('TmbdMovieDataSourceImpl : fetchMovieDetail test', () async {
    when(() =>
            mockDio!.get(any(), options: any(named: 'options')))
        .thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: jsonDecode(helper!.detailsSample),
      ),
    );
    final responseDto = await tmbdMovieDataSourceImpl!.fetchMovieDetail(123);
    expect(responseDto, isNotNull);
  });
}
