import 'package:whats_movies/data/mapper/entity_mapper.dart';

import 'package:whats_movies/data/models/movie_detail_model.dart';
import 'package:whats_movies/domains/movie_detail.dart';

class MovieDetailMapper implements EntityMapper<MovieDetailModel, MovieDetail> {
  @override
  MovieDetailModel mapFromDomain(MovieDetail domain) {
    return null;
  }

  @override
  MovieDetail mapFromEntity(MovieDetailModel entity) {

    return MovieDetail(
      id: entity.id,
      title: entity.title,
      overview: entity.overview,
      posterUrl: 'https://image.tmdb.org/t/p/w342'+entity.posterPath,
      backdropUrl: 'https://image.tmdb.org/t/p/w780'+entity.backdropPath,
      voteAverage: entity.voteAverage
    );
  }
}