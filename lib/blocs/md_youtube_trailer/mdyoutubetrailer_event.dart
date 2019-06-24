import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MDYoutubeTrailerEvent extends Equatable {
  MDYoutubeTrailerEvent([List props = const []]) : super(props);
}

class FetchMDYoutubeTrailer extends MDYoutubeTrailerEvent {

  final int id;

  FetchMDYoutubeTrailer({this.id});
}