import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UpcomingMoviesEvent extends Equatable {

  UpcomingMoviesEvent([List props = const []]) : super(props);
}

class FetchUpcomingMovies extends UpcomingMoviesEvent {

  @override
  String toString() => 'FetchUpcomingMovies';
}
