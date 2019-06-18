import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {

  Repository _repository;

  DetailMovieBloc({
    @required Repository repository
  }): assert(repository != null),
      _repository = repository;

  @override
  DetailMovieState get initialState => InitialDetailMovieState();

  @override
  Stream<DetailMovieState> mapEventToState(
    DetailMovieEvent event,
  ) async* {
    
    if (event is FetchDetailMovie) {

      yield LoadingDetailMovieState();
      try {
        
        final movieDetail = await _repository.fetchMovileDetail(id: event.id);
        yield LoadedDetailMovieState(movieDetail);

      } catch (e) {

        print(e);
        yield ErrorDetailMovieState();
      }
    }
  }
}
