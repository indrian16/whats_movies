import 'dart:async';
import 'dart:convert' as convert;
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:whats_movies/data/models/movie_list.dart';
import 'package:whats_movies/data/models/people_list.dart';
import 'package:whats_movies/data/models/movie_detail_model.dart';
import 'package:whats_movies/data/models/movie_detail_video.dart';
import 'package:whats_movies/data/models/media_model.dart';

import 'package:whats_movies/domains/domains.dart';

import 'package:whats_movies/data/mapper/mappers.dart';

import 'package:whats_movies/data/models/movie_detail_enum.dart';

class MovieApi {

  final http.Client _client;
  final MovieMapper _movieMapper;
  final PeopleMapper _peopleMapper;
  final MovieDetailMapper _movieDetailMapper;
  final MDVideoMapper _mdVideoMapper;
  final MovieMediaMapper _movieMediaMapper;

  final _apiKey = '955a6533e19558c1c73858d0f2d7fb07';

  MovieApi({
    @required http.Client client,
    @required MovieMapper movieMapper,
    @required PeopleMapper peopleMapper,
    @required MovieDetailMapper movieDetailMapper,
    @required MDVideoMapper mdVideoMapper,
    @required MovieMediaMapper movieMediaMapper
  }): _client = client,
      _movieMapper = movieMapper,
      _peopleMapper = peopleMapper,
      _movieDetailMapper = movieDetailMapper,
      _mdVideoMapper = mdVideoMapper,
      _movieMediaMapper = movieMediaMapper;

  Future<List<Movie>> fetchTrendingMovies() async {

    final response = await _client.get('https://api.themoviedb.org/3/trending/movie/week?api_key=$_apiKey');

    if (response.statusCode == 200) {

      print('[GET]fetchMovieTrendings: '+response.body);
      final result = MovieList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_movieMapper.mapFromEntity).toList();
    } else {

      throw Exception('[Error] Failed fetch trendin movies');
    }
  }

  Future<List<Movie>> fetchPopularMovies() async {

    final response = await _client.get('https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {

      print('[GET]fetchPopularMovies: '+response.body);
      final result = MovieList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_movieMapper.mapFromEntity).toList();
    } else {

      throw Exception('[Error] Failed fetcg popular movies');
    }
  }

  Future<List<Movie>> fetchUpcomingMovies() async {

    final response = await _client.get('https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey&language=en-US&page=1');

    if (response.statusCode == 200) {

      print('[GET]fetchUpcomingMovies: '+response.body);
      final result = MovieList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_movieMapper.mapFromEntity).toList();
    } else {

      throw Exception('[ERROR] Failed fetch upcoming movies');
    }
  }

  Future<List<People>> fetchPopularPeoples(int page) async {

    final response = await _client.get('https://api.themoviedb.org/3/person/popular?api_key=$_apiKey&language=en-US&page=$page');

    if (response.statusCode == 200) {

      print('[GET]fetchUpcomingMovies: '+response.body);
      final result = PeopleList.fromJson(convert.jsonDecode(response.body));
      return result.results.map(_peopleMapper.mapFromEntity).toList();
    } else {

      throw Exception('[ERROR] Failed fetch popular peoples page: $page');
    }
  }

  Future<MovieDetail> fetchMovieDetail(int id) async {

    final response = await _client.get('https://api.themoviedb.org/3/movie/$id?api_key=$_apiKey&language=en-US');

    if (response.statusCode == 200) {

      print('[GET]fetchMovieDetail: '+response.body);
      final result = MovieDetailModel.fromJson(convert.json.decode(response.body));
      return _movieDetailMapper.mapFromEntity(result);
    } else {

      throw Exception('[ERROR] Failed fetch movie detail by id: $id');
    }
  }

  Future<List<MDYoutubeTrailer>> fetchMDVideos(int id) async {

    final response = await _client.get('https://api.themoviedb.org/3/movie/$id/videos?api_key=$_apiKey&language=en-US');

    List<MDYoutubeTrailer> dataSorted = [];
    if (response.statusCode == 200) {

      print('[GET]fetchMDVideo: '+response.body);
      final result = MovieDetailVideo.fromJson(convert.json.decode(response.body));
      result.results.forEach((video) {

        if (video.site == Site.YOU_TUBE && video.type == Type.TRAILER) {

          dataSorted.add(_mdVideoMapper.mapFromEntity(video));
        }
      });

      return dataSorted;
    } else {

      throw Exception('[ERROR] Failed fetch movie detail video by id: $id');
    }
  }

  Future<MovieMedia> fetchMovieMedia(int id) async {

    final response = await _client.get('https://api.themoviedb.org/3/movie/$id/images?api_key=$_apiKey');

    if (response.statusCode == 200) {

      print('[GET]fetchMDVideo: '+response.body);
      final result = MediaModel.fromJson(convert.json.decode(response.body));
      
      return _movieMediaMapper.mapFromEntity(result);
    } else {

      throw Exception('[ERROR] Failed fetch movie media video by id: $id');
    }    
  }
}