import 'package:whats_movies/data/mapper/entity_mapper.dart';

import 'package:whats_movies/data/models/movie_detail_model.dart';
import 'package:whats_movies/domains/movie_detail.dart';
import 'package:whats_movies/domains/movie_genre.dart';

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
      voteAverage: entity.voteAverage,
      releaseDataStr: _parseDate(entity.releaseDate),
      genres: _convertGenre(entity.genres)
    );
  }

  String _parseDate(DateTime releaseDate) {

    String nameMonth = '';
    switch (releaseDate.month) {

      case 1:
      nameMonth = 'January';
      break;
      case 2:
      nameMonth = 'February';
      break;
      case 3:
      nameMonth = 'March';
      break;
      case 4:
      nameMonth = 'April';
      break;
      case 5:
      nameMonth = 'May';
      break;
      case 6:
      nameMonth = 'June';
      break;
      case 7:
      nameMonth = 'July';
      break;
      case 8:
      nameMonth = 'August';
      break;
      case 9:
      nameMonth = 'August';
      break;
      case 9:
      nameMonth = 'September';
      break;
      case 10:
      nameMonth = 'October';
      break;
      case 11:
      nameMonth = 'November';
      break;
      case 12:
      nameMonth = 'December';
      break;
    }

    return '${releaseDate.day} $nameMonth, ${releaseDate.year}';
  }

  List<Genre> _convertGenre(List<GenreModel> gm) {

    List<Genre> genres = [];
    gm.forEach((g) {

      if (g != null) {

        genres.add(Genre(
          id: g.id,
          name: g.name
        ));
      }
    });

    return genres;
  }
}