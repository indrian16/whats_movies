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
  final bool occuredError;

  LoadedPopularPeoplesState(
      {this.peoples, this.page, this.hasReachedMax, this.occuredError})
      : super([peoples, page, hasReachedMax, occuredError]);

  LoadedPopularPeoplesState copyWith(
      {List<People> peoples, int page, bool hasReachedMax, bool occuredError}) {
    return LoadedPopularPeoplesState(
        peoples: peoples ?? this.peoples,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        occuredError: occuredError ?? this.occuredError);
  }

  @override
  String toString() =>
      'LoadedPopularPeoplesState { peoples: ${peoples.length} page: $page, hasReachedMax: $hasReachedMax, occuredError: $occuredError }';
}

class ErrorPopularPeoplesState extends PopularPeoplesState {
  @override
  String toString() => 'ErrorPopularPeoplesState';
}
