import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'package:whats_movies/blocs/movie_detail/bloc.dart';

class MovieDetailPage extends StatefulWidget {
  
  final int id;

  const MovieDetailPage({Key key, this.id}) : super(key: key);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {

  MovieDetailBloc _detailMovieBloc = kiwi.Container().resolve<MovieDetailBloc>();

  @override
  void initState() {
    super.initState();
    
    _detailMovieBloc.dispatch(FetchMovieDetail(id: widget.id));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _detailMovieBloc,
        builder: (BuildContext context, MovieDetailState state) {
          
          if (state is InitialMovieDetailState) {

            return Center(child: Text('Initial'));
          }

          if (state is LoadingMovieDetailState) {

            return Center(child: Text('Loading'));
          }

          if (state is LoadedMovieDetailState) {

            return Center(child: Text('Name: ${state.detailMovie.title}'));
          }

          if (state is ErrorMovieDetailState) {

            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    
    _detailMovieBloc.dispose();
    super.dispose();
  }
}