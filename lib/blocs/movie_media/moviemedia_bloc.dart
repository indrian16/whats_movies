import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class MovieMediaBloc extends Bloc<MovieMediaEvent, MovieMediaState> {

  final Repository _repository;

  MovieMediaBloc({
    @required Repository repository
  }): assert(repository != null),
      _repository = repository;

  @override
  MovieMediaState get initialState => LoadingMovieMediaState();

  @override
  Stream<MovieMediaState> mapEventToState(
    MovieMediaEvent event,
  ) async* {
    
    if (event is FetchMovieMedia) {

      yield LoadingMovieMediaState();
      try {
        
        final movieMedia = await _repository.fetchMovieMedia(id: event.id);
        yield LoadedMovieMediaState(movieMedia: movieMedia);
      } catch (e) {

        yield ErrorMovieMediaState(e);
      }
    }
  }
}
