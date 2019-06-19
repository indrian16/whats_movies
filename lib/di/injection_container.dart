import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

import 'package:whats_movies/data/mapper/movie_mapper.dart';
import 'package:whats_movies/data/mapper/people_mapper.dart';
import 'package:whats_movies/data/mapper/movie_detail_mapper.dart';
import 'package:whats_movies/data/api/movie_api.dart';
import 'package:whats_movies/data/repositories/repository.dart';

import 'package:whats_movies/blocs/menu/bloc.dart';
import 'package:whats_movies/blocs/popular_movies/bloc.dart';
import 'package:whats_movies/blocs/trending_movies/bloc.dart';
import 'package:whats_movies/blocs/upcoming_movies/bloc.dart';
import 'package:whats_movies/blocs/popular_peoples/bloc.dart';
import 'package:whats_movies/blocs/movie_detail/bloc.dart';

void eatKiwi() {

  kiwi.Container()
  ..registerInstance(http.Client())
  ..registerInstance(MovieMapper())
  ..registerInstance(PeopleMapper())
  ..registerInstance(MovieDetailMapper())
  ..registerSingleton((c) => MovieApi(
    client: c.resolve<http.Client>(),
    movieMapper: c.resolve<MovieMapper>(),
    peopleMapper: c.resolve<PeopleMapper>(),
    movieDetailMapper: c.resolve<MovieDetailMapper>()
  ))
  ..registerSingleton((c) => Repository(movieApi: c.resolve<MovieApi>()))

  // BLoC
  ..registerFactory((_) => MenuBloc())
  ..registerFactory((c) => TrendingMoviesBloc(repository: c.resolve<Repository>()))
  ..registerFactory((c) => PopularMoviesBloc(repository: c.resolve<Repository>()))
  ..registerFactory((c) => UpcomingMoviesBloc(repository: c.resolve<Repository>()))
  ..registerFactory((c) => PopularPeoplesBloc(repository: c.resolve<Repository>()))
  ..registerFactory((c) => MovieDetailBloc(repository: c.resolve<Repository>()));
}