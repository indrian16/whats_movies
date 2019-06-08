import 'package:meta/meta.dart';
import 'dart:async';

import 'package:whats_movies/data/api/movie_api.dart';
import 'package:whats_movies/domains/movie.dart';

class Repository {

  final MovieApi _movieApi;

  Repository({
    @required MovieApi movieApi
  }): _movieApi = movieApi;

  Future<List<Movie>> fetchMovieTredings() => _movieApi.fetchMovieTrendings();
}