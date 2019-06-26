import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieMediaEvent extends Equatable {
  MovieMediaEvent([List props = const []]) : super(props);
}

class FetchMovieMedia extends MovieMediaEvent {

  final int id;

  FetchMovieMedia(this.id);

  @override
  String toString() => 'FetchMovieMedia { id: $id }';
}
