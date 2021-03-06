import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:whats_movies/domains/movie.dart';

@immutable
abstract class PopularMoviesState extends Equatable {

  PopularMoviesState([List props = const []]) : super(props);
}

class PopularUnitializedState extends PopularMoviesState {

  @override
  String toString() => 'PopularUnitialized';
}

class PopularLoadingState extends PopularMoviesState {

  @override
  String toString() => 'PopularLoadingState';
}

class PopularLoadedState extends PopularMoviesState {

  final List<Movie> movies;

  PopularLoadedState(this.movies);

  @override
  String toString() => 'PopularLoaded { movies: ${movies.length} }';
}

class PopularErrorState extends PopularMoviesState {

  final Exception exception;

  PopularErrorState(this.exception);

  @override
  String toString() => 'PopularError { exception: $exception }';
}