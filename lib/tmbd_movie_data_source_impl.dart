import 'package:dio/dio.dart';
import 'package:flutter_movie_app/movie_response_dto.dart/movie_response_dto.dart';

class TmbdMovieDataSourceImpl {
  TmbdMovieDataSourceImpl(this._dioClient);

  final Dio _dioClient;
  final _headers = {
    "Authorization": "Bearer ${const String.fromEnvironment("TMDB_API_KEY")}",
  };

  /// https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1
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
}
