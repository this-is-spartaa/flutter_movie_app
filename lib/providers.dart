import 'package:dio/dio.dart';
import 'package:flutter_movie_app/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/movie_data_source.dart';
import 'package:flutter_movie_app/movie_repository.dart';
import 'package:flutter_movie_app/movie_repository_impl.dart';
import 'package:flutter_movie_app/tmbd_movie_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return TmbdMovieDataSourceImpl(
    Dio(BaseOptions(validateStatus: (status) => true)),
  );
});

final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final fetchNowPlayingMoviesUsecaseProvider =
    Provider<FetchNowPlayingMoviesUsecase>(
      (ref) => FetchNowPlayingMoviesUsecase(ref.read(_movieRepositoryProvider)),
    );
