import 'package:whats_movies/data/mapper/entity_mapper.dart';
import 'package:whats_movies/domains/people.dart';
import 'package:whats_movies/data/models/people_list.dart';

class PeopleMapper implements EntityMapper<Result, People> {

  @override
  Result mapFromDomain(People domain) {
    return null;
  }

  @override
  People mapFromEntity(Result entity) {

    return People(
      name: entity.name,
      profileUrl: 'https://image.tmdb.org/t/p/w500/w185'+entity.profilePath,
      films: _shortTitleOrName(entity.knownFor)
    );
  }

  List<String> _shortTitleOrName(List<KnownFor> knows) {

    List<String> films = [];
    knows.forEach((film) {

      final title = film.title;
      final name = film.name;
      films.add(
        title == null ? name : title
      );
    });
    return films;
  }
}