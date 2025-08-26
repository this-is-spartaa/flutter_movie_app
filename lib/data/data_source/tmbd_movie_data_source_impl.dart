import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart/movie_response_dto.dart';

class TmbdMovieDataSourceImpl implements MovieDataSource {
  TmbdMovieDataSourceImpl(this._dioClient);

  final Dio _dioClient;
  final _headers = {
    "Authorization": "Bearer ${const String.fromEnvironment("TMDB_API_KEY")}",
  };

  /// https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    final response = await _dioClient.get(
      'https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1',
      options: Options(headers: _headers),
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/popular?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchPopularMovies(int page) async {
    final response = await _dioClient.get(
      'https://api.themoviedb.org/3/movie/popular?language=ko-KR&page=$page',
      options: Options(headers: _headers),
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/top_rated?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    final response = await _dioClient.get(
      'https://api.themoviedb.org/3/movie/top_rated?language=ko-KR&page=1',
      options: Options(headers: _headers),
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/upcoming?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    final response = await _dioClient.get(
      'https://api.themoviedb.org/3/movie/upcoming?language=ko-KR&page=1',
      options: Options(headers: _headers),
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/1?language=ko-KR
  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    final response = await _dioClient.get(
      'https://api.themoviedb.org/3/movie/$id?language=ko-KR',
      options: Options(headers: _headers),
    );
    if (response.statusCode == 200) {
      return MovieDetailDto.fromJson(response.data);
    }
    return null;
  }
}
