import 'package:meta/meta.dart';

import 'package:whats_movies/data/api/movie_api.dart';
import 'package:whats_movies/domains/domains.dart';

class Repository {

  final MovieApi _movieApi;

  Repository({
    @required MovieApi movieApi
  }): _movieApi = movieApi;

  Future<List<Movie>> fetchTredingMovies() => _movieApi.fetchTrendingMovies();

  Future<List<Movie>> fetchPopularMovies() => _movieApi.fetchPopularMovies();

  Future<List<Movie>> fetchUpcomingMovies() => _movieApi.fetchUpcomingMovies();

  Future<List<People>> fetchPopularPeoples({int page}) => _movieApi.fetchPopularPeoples(page);

  Future<MovieDetail> fetchMovileDetail({int id}) => _movieApi.fetchMovieDetail(id);
}