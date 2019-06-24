import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class MDYoutubeTrailerBloc extends Bloc<MDYoutubeTrailerEvent, MDYoutubeTrailerState> {

  final Repository _repository;

  MDYoutubeTrailerBloc({
    @required Repository repository
  }): assert(repository != null),
      _repository = repository;

  @override
  MDYoutubeTrailerState get initialState => LoadingMDYoutubeTrailerState();

  @override
  Stream<MDYoutubeTrailerState> mapEventToState(
    MDYoutubeTrailerEvent event,
  ) async* {
    

    if (event is FetchMDYoutubeTrailer) {

      yield LoadingMDYoutubeTrailerState();

      try {
        
        final trailerVideos = await _repository.fetchMDVideos(id: event.id);
        if (trailerVideos.isNotEmpty) {

          yield LoadedMDYoutubeTrailerState(trailers: trailerVideos);
        } else {

          yield EmptyMDYoutubeTrailerState();
        }
      } catch (e) {

        print(e);
        yield ErrorMDYoutubeTrailerState();
      }
    }
  }
}
