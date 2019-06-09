import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {

  final Repository _repository;

  TrendingMoviesBloc({
    @required Repository repository
  }): assert(repository != null),
      _repository = repository;

  @override
  TrendingMoviesState get initialState => TrendingUnitilizedState();

  @override
  Stream<TrendingMoviesState> mapEventToState(
    TrendingMoviesEvent event,
  ) async* {
    
    if (event is FetchTrendingMovies) {

      yield TrendingUnitilizedState();
      try {
        
        var movies = await _repository.fetchTredingMovies();
        yield TrendingLoadedState(movies: movies);
      } catch (e) {

        print(e);
        yield TrendingErrorState();
      }
    }
  }
}
