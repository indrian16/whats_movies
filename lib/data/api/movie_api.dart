import 'dart:async';
import 'dart:convert' as convert;
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:whats_movies/data/models/models.dart';
import 'package:whats_movies/domains/movie.dart';
import 'package:whats_movies/data/mapper/movie_mapper.dart';

class MovieApi {

  final http.Client _client;
  final MovieMapper _movieMapper;
  final _apiKey = '955a6533e19558c1c73858d0f2d7fb07';

  MovieApi({
    @required http.Client client,
    @required MovieMapper movieMapper
  }): _client = client,
      _movieMapper = movieMapper;

  Future<List<Movie>> fetchMovieTrendings() async {

    final response = await _client.get('https://api.themoviedb.org/3/trending/movie/week?api_key=$_apiKey');

    if (response.statusCode == 200) {

      print('[BODY]fetchMovieTrendings: '+response.body);
      var result = MovieList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_movieMapper.mapFromEntity).toList();
    } else {

      throw Exception('[Error] Failed fetch trendin list');
    }
  }
}