import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class PopularMoviesEvent extends Equatable {

  PopularMoviesEvent([List props = const []]) : super(props);
}

class FetchPopularMovies extends PopularMoviesEvent {

  @override
  String toString() => 'FetchPopularMovies';
}

class RefreshPopularMovies extends PopularMoviesEvent {

  @override
  String toString() => 'RefreshPopularMovies';
}