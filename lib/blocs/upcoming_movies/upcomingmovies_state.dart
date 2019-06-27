import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:whats_movies/domains/movie.dart';

@immutable
abstract class UpcomingMoviesState extends Equatable {

  UpcomingMoviesState([List props = const []]) : super(props);
}

class UpcomingUnitializedState extends UpcomingMoviesState {

  @override
  String toString() => 'UpcomingUnitializedState';
}

class UpcomingLoadingState extends UpcomingMoviesState {

  @override
  String toString() => 'UpcomingLoadingState';
}

class UpcomingLoadedState extends UpcomingMoviesState {

  final List<Movie> movies;

  UpcomingLoadedState(this.movies);

  @override
  String toString() => 'UpcomingLoadedState { movies: ${movies.length} }';
}

class UpcomingErrorState extends UpcomingMoviesState {

  final Exception exception;

  UpcomingErrorState(this.exception);

  @override
  String toString() => 'UpcomingErrorState { exception: $exception }';
}