import 'dart:async';
import 'dart:convert' as convert;
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:whats_movies/data/models/movie_list.dart';
import 'package:whats_movies/data/models/people_list.dart';
import 'package:whats_movies/domains/movie.dart';
import 'package:whats_movies/domains/people.dart';
import 'package:whats_movies/data/mapper/movie_mapper.dart';
import 'package:whats_movies/data/mapper/people_mapper.dart';

class MovieApi {

  final http.Client _client;
  final MovieMapper _movieMapper;
  final PeopleMapper _peopleMapper;
  final _apiKey = '955a6533e19558c1c73858d0f2d7fb07';

  MovieApi({
    @required http.Client client,
    @required MovieMapper movieMapper,
    @required PeopleMapper peopleMapper
  }): _client = client,
      _movieMapper = movieMapper,
      _peopleMapper = peopleMapper;

  Future<List<Movie>> fetchTrendingMovies() async {

    final response = await _client.get('https://api.themoviedb.org/3/trending/movie/week?api_key=$_apiKey');

    if (response.statusCode == 200) {

      print('[GET]fetchMovieTrendings: '+response.body);
      var result = MovieList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_movieMapper.mapFromEntity).toList();
    } else {

      throw Exception('[Error] Failed fetch trendin movies');
    }
  }

  Future<List<Movie>> fetchPopularMovies() async {

    final response = await _client.get('https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {

      print('[GET]fetchPopularMovies: '+response.body);
      var result = MovieList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_movieMapper.mapFromEntity).toList();
    } else {

      throw Exception('[Error] Failed fetcg popular movies');
    }
  }

  Future<List<Movie>> fetchUpcomingMovies() async {

    final response = await _client.get('https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {

      print('[GET]fetchUpcomingMovies: '+response.body);
      var result = MovieList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_movieMapper.mapFromEntity).toList();
    } else {

      throw Exception('[ERROR] Failed fetch upcoming movies');
    }
  }

  Future<List<People>> fetchPopularPeoples(int page) async {

    final response = await _client.get('https://api.themoviedb.org/3/person/popular?api_key=$_apiKey&language=en-US&page=$page');

    if (response.statusCode == 200) {

      print('[GET]fetchUpcomingMovies: '+response.body);
      var result = PeopleList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_peopleMapper.mapFromEntity).toList();
    } else {

      throw Exception('[ERROR] Failed fetch popular peoples page: $page');
    }
  }
}