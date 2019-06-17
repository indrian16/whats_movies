import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_movies/blocs/trending_movies/bloc.dart';
import 'package:whats_movies/domains/movie.dart';
import 'package:whats_movies/screens/detail/detail_movie.dart';

class TrendingList extends StatefulWidget {
  final TrendingMoviesBloc trendingMoviesBloc;

  const TrendingList({Key key, this.trendingMoviesBloc}) : super(key: key);
  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  TrendingMoviesBloc _trendingMoviesBloc;

  @override
  void initState() {
    super.initState();

    _trendingMoviesBloc = widget.trendingMoviesBloc;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.0,
      child: BlocBuilder(
        bloc: _trendingMoviesBloc,
        builder: (_, TrendingMoviesState state) {
          if (state is TrendingUnitilizedState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is TrendingLoadedState) {
            return ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return _buildTrendingItem(state.movies[index]);
              },
            );
          }

          if (state is TrendingErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      onPressed: () =>
                          _trendingMoviesBloc.dispatch(FetchTrendingMovies()),
                      icon: Icon(Icons.refresh, size: 35.0)),
                  Text(
                    'Reload Trending movies',
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

  Widget _buildTrendingItem(Movie movie) {
    return GestureDetector(
      onTap: () {
        
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailMovie(id: movie.id)
          )
        );
      },
      child: Card(
        elevation: 3.0,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          height: 255.0,
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: movie.backdropUrl,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      fontFamily: 'Lato-Bold',
                      fontSize: 16.0,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0)
                        )
                      ]
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
