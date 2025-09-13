import 'package:flutter_movie_app/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>?> fetchNowPlayingMovies();
}
