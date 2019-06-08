import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:whats_movies/domains/movie.dart';

@immutable
abstract class FetchtrendingsState extends Equatable {

  FetchtrendingsState([List props = const []]) : super(props);
}

class TrendingsUnitilized extends FetchtrendingsState {

  @override
  String toString() {
    
    return 'TrendingsUnitilized';
  }
}

class TrendingsLoaded extends FetchtrendingsState {

  final List<Movie> trendings;

  TrendingsLoaded(this.trendings);

  @override
  String toString() {
    
    return 'TrendingsLoaded { trendings: ${trendings.length} }';
  }
}

class TrendingsError extends FetchtrendingsState {

  @override
  String toString() {
    
    return 'TrendingError';
  }
}
