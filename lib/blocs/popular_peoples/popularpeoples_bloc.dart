import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:whats_movies/data/repositories/repository.dart';
import './bloc.dart';

class PopularPeoplesBloc
    extends Bloc<PopularPeoplesEvent, PopularPeoplesState> {
  final Repository _repository;

  PopularPeoplesBloc({Repository repository}) : _repository = repository;

  @override
  PopularPeoplesState get initialState => InitialPopularPeoplesState();

  @override
  Stream<PopularPeoplesState> transform(Stream<PopularPeoplesEvent> events,
      Stream<PopularPeoplesState> Function(PopularPeoplesEvent event) next) {
    return super.transform(
        (event as Observable<PopularPeoplesEvent>)
            .debounceTime(Duration(milliseconds: 500)),
        next);
  }

  @override
  Stream<PopularPeoplesState> mapEventToState(
    PopularPeoplesEvent event,
  ) async* {
    bool _hashReachedMax(PopularPeoplesState state) {
      return state is LoadedPopularPeoplesState && state.hasReachedMax;
    }

    if (event is FetchPeoples && !_hashReachedMax(currentState)) {

      if (currentState is InitialPopularPeoplesState) {
        try {
          final peoples = await _repository.fetchPopularPeoples(page: 1);
          yield LoadedPopularPeoplesState(
            peoples: peoples, 
            page: 1, 
            hasReachedMax: false,
            occuredError: false);
          return;
        } catch (e) {
          print(e);
          yield ErrorPopularPeoplesState();
        }
      }

      if (currentState is LoadedPopularPeoplesState) {

        yield* _loadedPopularPeoplesToState();
      }
    }
  }

  Stream<PopularPeoplesState> _loadedPopularPeoplesToState() async* {
    try {
      int nextPage = ((currentState as LoadedPopularPeoplesState).page) + 1;
      final peoples = await _repository.fetchPopularPeoples(page: nextPage);
      yield peoples.isEmpty
          ? (currentState as LoadedPopularPeoplesState)
              .copyWith(hasReachedMax: true)
          : LoadedPopularPeoplesState(
              peoples:
                  (currentState as LoadedPopularPeoplesState).peoples + peoples,
              page: nextPage,
              hasReachedMax: false,
              occuredError: false);
    } catch (e) {
      yield (currentState as LoadedPopularPeoplesState).copyWith(occuredError: true);
      print(e);
    }
  }
}
