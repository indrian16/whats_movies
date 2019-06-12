import 'package:meta/meta.dart';
import 'dart:async';

import 'package:whats_movies/data/api/movie_api.dart';
import 'package:whats_movies/domains/movie.dart';
import 'package:whats_movies/domains/people.dart';

class Repository {

  final MovieApi _movieApi;

  Repository({
    @required MovieApi movieApi
  }): _movieApi = movieApi;

  Future<List<Movie>> fetchTredingMovies() => _movieApi.fetchTrendingMovies();

  Future<List<Movie>> fetchPopularMovies() => _movieApi.fetchPopularMovies();

  Future<List<Movie>> fetchUpcomingMovies() => _movieApi.fetchUpcomingMovies();

  Future<List<People>> fetchPopularPeoples({int page}) => _movieApi.fetchPopularPeoples(page);
}