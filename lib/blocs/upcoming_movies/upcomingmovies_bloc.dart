import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final Repository _repository;

  UpcomingMoviesBloc({@required Repository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  UpcomingMoviesState get initialState => UpcomingUnitializedState();

  @override
  Stream<UpcomingMoviesState> mapEventToState(
    UpcomingMoviesEvent event,
  ) async* {

    if (event is FetchUpcomingMovies && currentState is UpcomingUnitializedState) {
      
      yield* _fetchUpcomingMoviesToState();
    }

    if (event is RefreshUpcomingMovies) {

      yield* _fetchUpcomingMoviesToState();
    }
  }

  Stream<UpcomingMoviesState> _fetchUpcomingMoviesToState() async* {

    yield UpcomingLoadingState();
    try {

      final movies = await _repository.fetchUpcomingMovies();
      yield UpcomingLoadedState(movies);
    } catch (e) {

      yield UpcomingErrorState(e);
    }
  }
}
