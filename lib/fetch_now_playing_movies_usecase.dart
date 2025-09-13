import 'package:flutter_movie_app/movie.dart';
import 'package:flutter_movie_app/movie_repository.dart';

class FetchNowPlayingMoviesUsecase {
  FetchNowPlayingMoviesUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>?> execute() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }
}
