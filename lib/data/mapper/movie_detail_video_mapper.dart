import 'entity_mapper.dart';

import 'package:whats_movies/data/models/movie_detail_video.dart';
import 'package:whats_movies/domains/md_youtube_trailer.dart';

class MDVideoMapper extends EntityMapper<Result, MDYoutubeTrailer> {

  @override
  Result mapFromDomain(MDYoutubeTrailer domain) {
    
    return null;
  }

  @override
  MDYoutubeTrailer mapFromEntity(Result entity) {
    
    return MDYoutubeTrailer(
      name: entity.name,
      thumbnailUrl: 'https://img.youtube.com/vi/${entity.key}/0.jpg'
    );
  }
}