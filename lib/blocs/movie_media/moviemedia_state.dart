import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:whats_movies/domains/movie_media.dart';

@immutable
abstract class MovieMediaState extends Equatable {
  MovieMediaState([List props = const []]) : super(props);
}

class LoadingMovieMediaState extends MovieMediaState {

  @override
  String toString() => 'LoadingMovieMediaState';
}

class LoadedMovieMediaState extends MovieMediaState {

  final MovieMedia movieMedia;

  LoadedMovieMediaState({this.movieMedia});

  @override
  String toString() => 'LoadedMovieMediaState { movieMedia: $movieMedia }';
}

class ErrorMovieMediaState extends MovieMediaState {

  @override
  String toString() => 'ErrorMovieMediaState';
}
