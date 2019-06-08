import 'entity_mapper.dart';
import 'package:whats_movies/data/models/models.dart';
import 'package:whats_movies/domains/movie.dart';

class MovieMapper implements EntityMapper<Result, Movie> {

  @override
  Result mapFromDomain(Movie domain) {
    
    return Result();
  }

  @override
  Movie mapFromEntity(Result entity) {

    return Movie(
      title: entity.title,
      posterUrl: 'https://image.tmdb.org/t/p/w342/'+entity.posterPath,
      backdropUrl: 'https://image.tmdb.org/t/p/w780/'+entity.backdropPath,
      voteAverage: entity.voteAverage
    );
  }
}