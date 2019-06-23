import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
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
  final _scrollController = ScrollController();
  bool _isSrink = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
    _detailMovieBloc.dispatch(FetchMovieDetail(id: widget.id));
  }

  void _scrollListener() => setState(() {
    
    if (_scrollController.hasClients && _scrollController.offset >= 300) {
      _isSrink = true;
    } else {
      _isSrink = false;
    }
  });

  Widget _buildGenreChips(List<Genre> genres) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genres.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: InputChip(
            onPressed: () {
              print('genreId: ${genres[index].id}');
            },
            label: Text(genres[index].name,
                style: TextStyle(fontFamily: 'Lato', fontSize: 10.0)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _detailMovieBloc,
      builder: (_, MovieDetailState state) {
        if (state is LoadingMovieDetailState) {
          return Material(
            child: Center(child: Text('Loading')),
          );
        }

        if (state is LoadedMovieDetailState) {
          return _buildLoadedState(state.movieDetail);
        }

        if (state is ErrorMovieDetailState) {
          return Material(
            child: Center(child: Text('Error')),
          );
        }
      },
    );
  }

  Widget _buildLoadedState(MovieDetail movieDetail) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                pinned: true,
                floating: true,
                expandedHeight: 350.0,
                title: Text(
                  _isSrink ? movieDetail.title : '',
                  style: TextStyle(fontFamily: 'Lato-Bold'),
                ),
                iconTheme: IconThemeData(color: _isSrink ? Colors.black : Colors.white),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share, size: 22.0),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: movieDetail.backdropUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          height: 150.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Card(
                                elevation: 6.0,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
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
                                padding: EdgeInsets.all(4.0),
                                child: Row(
                                  children: <Widget>[
                                    RawChip(
                                      avatar: Icon(Icons.stars, size: 18.0),
                                      label: Text(
                                        '${movieDetail.voteAverage}'
                                      ),
                                    ),
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
                          height: 120.0,
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  movieDetail.releaseDataStr,
                                  style: TextStyle(fontFamily: 'Lato', fontSize: 13.0),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  movieDetail.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontFamily: 'Lato-Bold', fontSize: 16.0),
                                ),
                                Flexible(
                                  child: _buildGenreChips(movieDetail.genres),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBar(
                  tabBar: TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                        'The Info',
                        style: TextStyle(fontFamily: 'Lato-Bold'),
                        )
                      ),
                      Tab(
                        child: Text(
                        'Cast',
                        style: TextStyle(fontFamily: 'Lato-Bold'),
                        )
                      ),
                      Tab(
                        child: Text(
                        'Similiar',
                        style: TextStyle(fontFamily: 'Lato-Bold'),
                        )
                      ),
                    ],
                  )
                ),
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              _buildInfoTabContent(movieDetail),
              Center(child: Text('2')),
              Center(child: Text('3')),
            ],
          )
        ),
      ),
    );
  }

  Widget _buildInfoTabContent(MovieDetail movieDetail) {
    
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MovieOverview(overview: movieDetail.overview)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _detailMovieBloc.dispose();
    super.dispose();
  }
}

class _SliverTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBar({this.tabBar});

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
