import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  
  @override
  MenuState get initialState => HomeState();

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    
    if (event is SelectHome && currentState != HomeState) {

      yield HomeState();
    }

    if (event is SelectDiscover && currentState != DiscoverState) {

      yield DiscoverState();
    }

    if (event is SelectPeople && currentState != PeopleState) {

      yield PeopleState();
    }
  }
}
