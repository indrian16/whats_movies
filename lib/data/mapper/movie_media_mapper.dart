import 'entity_mapper.dart';

import 'package:whats_movies/data/models/media_model.dart';
import 'package:whats_movies/domains/movie_media.dart';

class MovieMediaMapper extends EntityMapper<MediaModel, MovieMedia> {

  @override
  MediaModel mapFromDomain(MovieMedia domain) {
    return null;
  }

  @override
  MovieMedia mapFromEntity(MediaModel entity) {

    return MovieMedia(
      urlBackdrops: entity.backdrops.map((b) => 'https://image.tmdb.org/t/p/w780'+b.filePath).toList(),
      urlPosters: entity.posters.map((p) => 'https://image.tmdb.org/t/p/w342'+p.filePath).toList()
    );
  }
}