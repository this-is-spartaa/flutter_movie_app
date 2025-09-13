import 'package:flutter_movie_app/movie_repository_impl.dart';
import 'package:flutter_movie_app/movie.dart';

class FetchNowPlayingMoviesUsecase {
  FetchNowPlayingMoviesUsecase(this._movieRepository);
  final MovieRepositoryImpl _movieRepository;

  Future<List<Movie>?> execute() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }
}
