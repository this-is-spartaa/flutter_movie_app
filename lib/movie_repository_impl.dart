import 'package:flutter_movie_app/movie.dart';
import 'package:flutter_movie_app/tmbd_movie_data_source_impl.dart';

class MovieRepositoryImpl {
  MovieRepositoryImpl(this._movieDataSource);

  final TmbdMovieDataSourceImpl _movieDataSource;

  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    if (result == null) {
      return null;
    }

    return result.results
        .map(
          (e) => Movie(
            id: e.id,
            posterPath: 'https://image.tmdb.org/t/p/w500${e.posterPath}',
          ),
        )
        .toList();
  }
}
