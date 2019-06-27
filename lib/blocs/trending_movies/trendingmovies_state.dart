import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:whats_movies/domains/movie.dart';

@immutable
abstract class TrendingMoviesState extends Equatable {

  TrendingMoviesState([List props = const []]) : super(props);
}

class TrendingUnitilizedState extends TrendingMoviesState {

  @override
  String toString() {
    
    return 'TrendingsUnitilized';
  }
}

class TrendingLoadingState extends TrendingMoviesState {

  @override
  String toString() {
    
    return 'TrendingLoadingState';
  }
}

class TrendingLoadedState extends TrendingMoviesState {

  final List<Movie> movies;

  TrendingLoadedState({this.movies});

  @override
  String toString() {
    
    return 'TrendingLoadedState { movies: ${movies.length} }';
  }
}

class TrendingErrorState extends TrendingMoviesState {

  final Exception exception;

  TrendingErrorState(this.exception);

  @override
  String toString() {
    
    return 'TrendingError { exception: $exception }';
  }
}
