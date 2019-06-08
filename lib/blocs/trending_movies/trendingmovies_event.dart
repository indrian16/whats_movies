import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class TrendingMoviesEvent extends Equatable {

  TrendingMoviesEvent([List props = const []]) : super(props);
}

class FetchTrendingMovies extends TrendingMoviesEvent {

  @override
  String toString() {
    
    return 'FetchTrendingMovies';
  }
}