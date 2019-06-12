import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:whats_movies/domains/people.dart';

@immutable
abstract class PopularPeoplesState extends Equatable {
  PopularPeoplesState([List props = const []]) : super(props);
}

class InitialPopularPeoplesState extends PopularPeoplesState {
  @override
  String toString() => 'InitialPopularPeoplesState';
}

class LoadedPopularPeoplesState extends PopularPeoplesState {
  final List<People> peoples;
  final int page;
  final bool hasReachedMax;

  LoadedPopularPeoplesState({this.peoples, this.page, this.hasReachedMax})
      : super([peoples, page, hasReachedMax]);

  LoadedPopularPeoplesState copyWitn({
    List<People> peoples,
    int page,
    bool hasReachedMax
  }) {

    return LoadedPopularPeoplesState(
      peoples: peoples ?? this.peoples,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  String toString() => 'LoadedPopularPeoplesState { peoples: ${peoples.length} page: $page, hasReachedMax: $hasReachedMax }';
}

class ErrorPopularPeoplesState extends PopularPeoplesState {
  @override
  String toString() => 'ErrorPopularPeoplesState';
}
