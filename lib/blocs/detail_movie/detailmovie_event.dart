import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailMovieEvent extends Equatable {
  DetailMovieEvent([List props = const []]) : super(props);
}

class FetchDetailMovie extends DetailMovieEvent {

  final int id;

  FetchDetailMovie(this.id);

  @override
  String toString() => 'FetchDetailMovie';
}