import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'package:whats_movies/blocs/movie_detail/bloc.dart';
import 'package:whats_movies/domains/movie_detail.dart';
import 'package:whats_movies/domains/movie_genre.dart';

import 'package:whats_movies/screens/widgets/movie_detail/movie_details.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;

  const MovieDetailPage({Key key, this.id}) : super(key: key);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _detailMovieBloc = kiwi.Container().resolve<MovieDetailBloc>();

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
            return _loadedState(state.movieDetail);
          }

          if (state is ErrorMovieDetailState) {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }

  Widget _buildGenreChip(List<Genre> genres) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: genres.map((g) {
          return Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: InputChip(
                onPressed: () {
                  print('clickId: ${g.id}');
                },
                label: Text(
                  g.name,
                  style: TextStyle(fontFamily: 'Lato', fontSize: 12.0),
                ),
              ),
            ),
          );
        }).toList());
  }

  Widget _loadedState(MovieDetail movieDetail) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 380.0,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: movieDetail.backdropUrl,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 100.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 150.0,
                      child: Row(
                        children: <Widget>[
                          Card(
                            elevation: 6.0,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Container(
                              width: 90.0,
                              height: 120.0,
                              child: CachedNetworkImage(
                                imageUrl: movieDetail.posterUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 80.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Vote: ${movieDetail.voteAverage}',
                                  style: TextStyle(fontFamily: 'Lato-Bold'),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  child: Icon(Icons.add_alert),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  child: Icon(Icons.bookmark_border),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            movieDetail.releaseDataStr,
                            style:
                                TextStyle(fontFamily: 'Lato', fontSize: 14.0),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            movieDetail.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 6.0),
                          _buildGenreChip(movieDetail.genres)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            _buildBody(movieDetail)
          ],
        ),
      ),
    );
  }

  Widget _buildBody(MovieDetail movieDetail) {
    return Container(
      height: 454.0,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              height: 54.0,
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'The Info',
                      style: TextStyle(fontFamily: 'Lato-Bold'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Cast',
                      style: TextStyle(fontFamily: 'Lato-Bold'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Comments',
                      style: TextStyle(fontFamily: 'Lato-Bold'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      MovieOverview(overview: movieDetail.overview)
                    ],
                  ),
                  Center(child: Text('2')),
                  Center(child: Text('3')),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _detailMovieBloc.dispose();
    super.dispose();
  }
}
