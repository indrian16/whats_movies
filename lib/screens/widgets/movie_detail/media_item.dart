import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'package:whats_movies/blocs/movie_media/bloc.dart';

class MediaItem extends StatefulWidget {
  final int id;

  const MediaItem({Key key, this.id}) : super(key: key);

  @override
  _MediaItemState createState() => _MediaItemState();
}

class _MediaItemState extends State<MediaItem> {
  final MovieMediaBloc _movieMediaBloc =
      kiwi.Container().resolve<MovieMediaBloc>();

  @override
  void initState() {
    super.initState();

    _movieMediaBloc.dispatch(FetchMovieMedia(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: BlocBuilder(
        bloc: _movieMediaBloc,
        builder: (_, MovieMediaState state) {
          if (state is LoadingMovieMediaState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is LoadedMovieMediaState) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Card(
                  elevation: 3.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  semanticContainer: true,
                  child: Container(
                    height: 140.0,
                    width: 100.0,
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: state.movieMedia.urlPosters.isNotEmpty ? state.movieMedia.urlPosters[0] : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Chip(
                              label: Text(
                                'x${state.movieMedia.urlPosters.length}',
                                style: TextStyle(fontFamily: 'Lato', fontSize: 10.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () { print('poster'); },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  semanticContainer: true,
                  child: Container(
                    height: 140.0,
                    width: 200.0,
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: state.movieMedia.urlBackdrops.isNotEmpty ? state.movieMedia.urlBackdrops[0] : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Chip(
                              label: Text(
                                'x${state.movieMedia.urlBackdrops.length}',
                                style: TextStyle(fontFamily: 'Lato', fontSize: 10.0),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () { print('backdrop'); },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is ErrorMovieMediaState) {
            return Center(child: Text('error'));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _movieMediaBloc.dispose();
    super.dispose();
  }
}
