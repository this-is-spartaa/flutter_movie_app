import 'package:flutter_movie_app/movie.dart';
import 'package:flutter_movie_app/movie_data_source.dart';
import 'package:flutter_movie_app/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);

  final MovieDataSource _movieDataSource;

  @override
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
