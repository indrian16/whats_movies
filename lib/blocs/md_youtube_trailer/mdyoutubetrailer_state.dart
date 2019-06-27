import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:whats_movies/domains/md_youtube_trailer.dart';

@immutable
abstract class MDYoutubeTrailerState extends Equatable {
  MDYoutubeTrailerState([List props = const []]) : super(props);
}

class LoadingMDYoutubeTrailerState extends MDYoutubeTrailerState {

  @override
  String toString() => 'LoadingMDYoutubeTrailerState';
}

class LoadedMDYoutubeTrailerState extends MDYoutubeTrailerState {

  final List<MDYoutubeTrailer> trailers;

  LoadedMDYoutubeTrailerState({this.trailers});
  
  @override
  String toString() => 'LoadedMDYoutubeTrailerState{ trainlers: ${trailers.length} }';
}

class EmptyMDYoutubeTrailerState extends MDYoutubeTrailerState {

  @override
  String toString() => 'EmptyMDYoutubeTrailerState';
}

class ErrorMDYoutubeTrailerState extends MDYoutubeTrailerState {
  
  final Exception exception;

  ErrorMDYoutubeTrailerState(this.exception);

  @override
  String toString() => 'ErrorMDYoutubeTrailerState { exception: $exception }';
}
