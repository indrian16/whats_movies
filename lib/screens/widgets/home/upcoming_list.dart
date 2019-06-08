import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:whats_movies/blocs/upcoming_movies/bloc.dart';
import 'package:whats_movies/domains/movie.dart';

class UpcomingList extends StatefulWidget {
  @override
  _UpcomingListState createState() => _UpcomingListState();
}

class _UpcomingListState extends State<UpcomingList> {
  UpcomingMoviesBloc _upcomingMoviesBloc;

  @override
  void initState() {
    super.initState();
    _upcomingMoviesBloc = BlocProvider.of<UpcomingMoviesBloc>(context);
    _upcomingMoviesBloc.dispatch(FetchUpcomingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      child: BlocBuilder(
        bloc: _upcomingMoviesBloc,
        builder: (_, UpcomingMoviesState state) {
          if (state is UpcomingUnitializedState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is UpcomingLoadedState) {
            return ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return _buildPopularItem(state.movies[index]);
              },
            );
          }

          if (state is UpcomingErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      onPressed: () =>
                          _upcomingMoviesBloc.dispatch(FetchUpcomingMovies()),
                      icon: Icon(Icons.refresh, size: 35.0)),
                  Text(
                    'Reload Trendings',
                    style: TextStyle(fontFamily: 'Lato'),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildPopularItem(Movie movie) {
    return Container(
      width: 130.0,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 6.0,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: 120.0,
              height: 170.0,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: movie.posterUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 1.0,
                    top: 3.0,
                    child: Container(
                      width: 40.0,
                      child: Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Positioned(
                                  left: 1.0,
                                  top: 2.0,
                                  child: Icon(Icons.star,
                                      color: Colors.black38, size: 15.0)),
                              Icon(Icons.star, color: Colors.white, size: 15.0),
                            ],
                          ),
                          Text(
                            '${movie.voteAverage}',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 12.0,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            movie.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Lato'),
          )
        ],
      ),
    );
  }
}
