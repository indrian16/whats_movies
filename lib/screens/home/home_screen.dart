import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_movies/blocs/popular_movies/bloc.dart';
import 'package:whats_movies/blocs/trending_movies/bloc.dart';
import 'package:whats_movies/blocs/upcoming_movies/bloc.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TrendingMoviesBloc _trendingMoviesBloc;
  PopularMoviesBloc _popularMoviesBloc;
  UpcomingMoviesBloc _upcomingMoviesBloc;

  @override
  void initState() {
    super.initState();

    _trendingMoviesBloc = BlocProvider.of<TrendingMoviesBloc>(context);
    _popularMoviesBloc = BlocProvider.of<PopularMoviesBloc>(context);
    _upcomingMoviesBloc = BlocProvider.of<UpcomingMoviesBloc>(context);

    _trendingMoviesBloc.dispatch(FetchTrendingMovies());
    _popularMoviesBloc.dispatch(FetchPopularMovies());
    _upcomingMoviesBloc.dispatch(FetchUpcomingMovies());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TrendingList(
                trendingMoviesBloc: _trendingMoviesBloc,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Popular',
                          style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontSize: 18.0,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            print('goMorePopularMovie()');
                          },
                          child: Text(
                            'See all >',
                            style: TextStyle(
                                fontFamily: 'Lato', color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  PopularList(
                    popularMoviesBloc: _popularMoviesBloc,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Upcoming',
                          style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontSize: 18.0,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            print('goMorePopularMovie()');
                          },
                          child: Text(
                            'See all >',
                            style: TextStyle(
                                fontFamily: 'Lato', color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  UpcomingList(
                    upcomingMoviesBloc: _upcomingMoviesBloc,
                  ),
                  SizedBox(height: 16.0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
