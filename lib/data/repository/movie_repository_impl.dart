import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

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

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
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

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
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

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
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

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final result = await _movieDataSource.fetchMovieDetail(id);
    if (result == null) {
      return null;
    }
    return MovieDetail(
      budget: result.budget,
      genres: result.genres.map((e) => e.name).toList(),
      id: result.id,
      productionCompanyLogos:
          result.productionCompanies
              .where((e) => e.logoPath != null)
              .map((e) => 'https://image.tmdb.org/t/p/w500${e.logoPath}')
              .toList(),
      overview: result.overview,
      popularity: result.popularity,
      releaseDate: result.releaseDate,
      revenue: result.revenue,
      runtime: result.runtime,
      tagline: result.tagline,
      title: result.title,
      voteAverage: result.voteAverage,
      voteCount: result.voteCount,
    );
  }
}
