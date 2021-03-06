import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final Repository _repository;

  PopularMoviesBloc({@required Repository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  PopularMoviesState get initialState => PopularUnitializedState();

  @override
  Stream<PopularMoviesState> mapEventToState(
    PopularMoviesEvent event,
  ) async* {

    if (event is FetchPopularMovies &&currentState is PopularUnitializedState) {

      yield* _fetchPopularMoviesToState();
    }

    if (event is RefreshPopularMovies) {

      yield* _fetchPopularMoviesToState();
    }
  }

  Stream<PopularMoviesState> _fetchPopularMoviesToState() async* {

    yield PopularLoadingState();  
    try {

      final movies = await _repository.fetchPopularMovies();
      yield PopularLoadedState(movies);
    } catch (e) {

      yield PopularErrorState(e);
    }
  }
}
