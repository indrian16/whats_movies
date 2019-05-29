import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class MenuEvent extends Equatable {

  MenuEvent([List props = const []]) : super(props);
}

class SelectHome extends MenuEvent {
  
  @override
  String toString() => 'SelectHome';
}

class SelectPeople extends MenuEvent {

  @override
  String toString() => 'SelectPeople';
}

class SelectDiscover extends MenuEvent {

  @override
  String toString() => 'SelectDiscover';
}