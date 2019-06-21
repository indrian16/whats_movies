import 'movie_genre.dart';

class MovieDetail {

  final int id;
  final String title;
  final String overview;
  final String posterUrl;
  final String backdropUrl;
  final double voteAverage;
  final String releaseDataStr;
  final List<Genre> genres;

  MovieDetail({this.id, this.title, this.overview, this.posterUrl, this.backdropUrl, this.voteAverage, this.releaseDataStr, this.genres});
}