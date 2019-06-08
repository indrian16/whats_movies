import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:whats_movies/data/repositories/repository.dart';

class FetchtrendingsBloc extends Bloc<FetchtrendingsEvent, FetchtrendingsState> {

  final Repository _repository;

  FetchtrendingsBloc({@required Repository repository}) : _repository = repository;

  @override
  FetchtrendingsState get initialState => TrendingsUnitilized();

  @override
  Stream<FetchtrendingsState> mapEventToState(
    FetchtrendingsEvent event,
  ) async* {
    
    if (event is FetchTrendings) {

      try {
        
        var data = await _repository.fetchMovieTredings();
        yield TrendingsLoaded(data);
      } catch (e) {

        print(e);
        yield TrendingsError();
      }
    }
  }
}
