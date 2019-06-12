import 'package:equatable/equatable.dart';

class People extends Equatable {
  final String name;
  final String profileUrl;
  final List<String> films;

  String get filmsToString => films.join(', ');

  People({this.name, this.profileUrl, this.films});

  @override
  String toString() => 'Peoples { Name: $name, Films: $filmsToString }';
}
