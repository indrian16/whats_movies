import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class MenuState extends Equatable {

  final int currentTab = 0;

  MenuState([List props = const []]) : super(props);
}
  
class HomeState extends MenuState {

  final int currentTab = 0;

  @override
  String toString() => 'HomeState';
}

class PeopleState extends MenuState {

  final int currentTab = 1;

  @override
  String toString() => 'People';
}


class DiscoverState extends MenuState {

  final int currentTab = 2;

  @override
  String toString() => 'DiscoverState';
}