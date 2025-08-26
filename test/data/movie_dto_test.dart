import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_response_dto.dart/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import 'samples/sample_test_helper.dart';

void main() {
  SampleTestHelper? helper;
  setUp(
    () async {
      helper = SampleTestHelper();
      await helper!.loadFixture();
    },
  );

  test('Movie DTO : fromJson all case test', () {
    final nowPlayingMovieDto =
        MovieResponseDto.fromJson(jsonDecode(helper!.nowPlayingSample));
    expect(nowPlayingMovieDto.results.length, 20);

    final popularMovieDto =
        MovieResponseDto.fromJson(jsonDecode(helper!.popularSample));
    expect(popularMovieDto.results.length, 20);

    final topRatedMovieDto =
        MovieResponseDto.fromJson(jsonDecode(helper!.topRatedSample));
    expect(topRatedMovieDto.results.length, 20);

    final upcomingMovieDto =
        MovieResponseDto.fromJson(jsonDecode(helper!.upcomingSample));
    expect(upcomingMovieDto.results.length, 20);
  });

  test('Movie DTO : fromJson results test', () {
    final popularJson = jsonDecode(helper!.popularSample);
    final movieDto = MovieResponseDto.fromJson(popularJson);

    expect(movieDto.page, 1);
    expect(movieDto.results.length, 20);
    expect(movieDto.results.first.title, "모아나 2");
    expect(movieDto.results.first.genreIds.length, 4);

    // 위에는 객체 내까지
    // 아래는 nullable 처리 잘 되었는지 => 파싱 성공 테스트

    final nowPlaying =
        MovieResponseDto.fromJson(jsonDecode(helper!.nowPlayingSample));
    expect(nowPlaying.page, 1);
    expect(nowPlaying.results.length, 20);

    final topRated =
        MovieResponseDto.fromJson(jsonDecode(helper!.topRatedSample));
    expect(topRated.page, 1);
    expect(topRated.results.length, 20);

    final upcoming =
        MovieResponseDto.fromJson(jsonDecode(helper!.upcomingSample));
    expect(upcoming.page, 1);
    expect(upcoming.results.length, 20);
  });
}
