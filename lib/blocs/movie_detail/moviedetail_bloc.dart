import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {

  final Repository _repository;

  MovieDetailBloc({
    @required Repository repository
  }): assert(repository != null),
      _repository = repository;

  @override
  MovieDetailState get initialState => InitialMovieDetailState();

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    
    if (event is FetchMovieDetail) {

      yield LoadingMovieDetailState();
      try {
        
        final movieDetail = await _repository.fetchMovileDetail(id: event.id);
        yield LoadedMovieDetailState(movieDetail);

      } catch (e) {

        print(e);
        yield ErrorMovieDetailState();
      }
    }
  }

}
