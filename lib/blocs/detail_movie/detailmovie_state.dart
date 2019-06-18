import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:whats_movies/domains/movie_detail.dart';

@immutable
abstract class DetailMovieState extends Equatable {
  DetailMovieState([List props = const []]) : super(props);
}

class InitialDetailMovieState extends DetailMovieState {

  @override
  String toString() => 'InitialDetailMovieState';
}

class LoadingDetailMovieState extends DetailMovieState {

  @override
  String toString() => 'LoadingDetailMovieState';
}

class LoadedDetailMovieState extends DetailMovieState {

  final MovieDetail detailMovie;

  LoadedDetailMovieState(this.detailMovie);

  @override
  String toString() => 'LoadedDetailMovieState { title: ${detailMovie.title} }';
}

class ErrorDetailMovieState extends DetailMovieState {

  @override
  String toString() => 'ErrorDetailMovieState';
}
