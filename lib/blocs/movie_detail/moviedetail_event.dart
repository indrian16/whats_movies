import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieDetailEvent extends Equatable {
  MovieDetailEvent([List props = const []]) : super(props);
}

class FetchMovieDetail extends MovieDetailEvent {

  final int id;

  FetchMovieDetail({this.id});

  @override
  String toString() => 'FetchDetailMovie';
}