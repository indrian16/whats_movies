import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:whats_movies/domains/movie_detail.dart';

@immutable
abstract class MovieDetailState extends Equatable {
  MovieDetailState([List props = const []]) : super(props);
}

class LoadingMovieDetailState extends MovieDetailState {

  @override
  String toString() => 'LoadingDetailMovieState';
}

class LoadedMovieDetailState extends MovieDetailState {

  final MovieDetail movieDetail;

  LoadedMovieDetailState(this.movieDetail);

  @override
  String toString() => 'LoadedDetailMovieState { title: ${movieDetail.title} }';
}

class ErrorMovieDetailState extends MovieDetailState {

  final Exception exception;

  ErrorMovieDetailState(this.exception);

  @override
  String toString() => 'ErrorDetailMovieState { exception: $exception }';
}
