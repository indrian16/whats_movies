import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class FetchtrendingsEvent extends Equatable {

  FetchtrendingsEvent([List props = const []]) : super(props);
}

class FetchTrendings extends FetchtrendingsEvent {

  @override
  String toString() {
    
    return 'FetchTrendings';
  }
}