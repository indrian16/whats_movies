import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:whats_movies/blocs/popular_movies/bloc.dart';
import 'package:whats_movies/domains/movie.dart';
import 'package:whats_movies/screens/movie_detail/movie_detail_page.dart';

class PopularList extends StatefulWidget {

  @override
  _PopularListState createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {

  PopularMoviesBloc _popularMoviesBloc;

  @override
  void initState() {
    super.initState();

    _popularMoviesBloc = BlocProvider.of<PopularMoviesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      child: BlocBuilder(
        bloc: _popularMoviesBloc,
        builder: (_, PopularMoviesState state) {

          if (state is PopularUnitializedState) {
            return Center(child: Text('wait'));
          }

          if (state is PopularLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PopularLoadedState) {
            return ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieDetailPage(id: state.movies[index].id)
                    ));
                  },
                  child: _buildPopularItem(state.movies[index]),
                );
              },
            );
          }

          if (state is PopularErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () =>
                        _popularMoviesBloc.dispatch(RefreshPopularMovies()),
                    icon: Icon(Icons.refresh, size: 35.0),
                    splashColor: Colors.black,
                  ),
                  Text(
                    'Reload popular movies',
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
            margin: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
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
