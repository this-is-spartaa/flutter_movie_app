import 'package:flutter_movie_app/movie_response_dto.dart/movie_response_dto.dart';

abstract interface class MovieDataSource {
  Future<MovieResponseDto?> fetchNowPlayingMovies();
}
