import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PopularPeoplesEvent extends Equatable {
  PopularPeoplesEvent([List props = const []]) : super(props);
}

class FetchPeoples extends PopularPeoplesEvent {

  @override
  String toString() => 'FetchPeoples';
}