import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'package:whats_movies/blocs/md_youtube_trailer/bloc.dart';
import 'package:whats_movies/domains/md_youtube_trailer.dart';

class TrailerList extends StatefulWidget {
  final int id;

  const TrailerList({Key key, this.id}) : super(key: key);

  @override
  _TrailerListState createState() => _TrailerListState();
}

class _TrailerListState extends State<TrailerList> {
  final _mdYoutubeTrailerBloc =
      kiwi.Container().resolve<MDYoutubeTrailerBloc>();

  @override
  void initState() {
    super.initState();

    _mdYoutubeTrailerBloc.dispatch(FetchMDYoutubeTrailer(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: BlocBuilder(
        bloc: _mdYoutubeTrailerBloc,
        builder: (BuildContext context, MDYoutubeTrailerState state) {
          if (state is LoadingMDYoutubeTrailerState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is LoadedMDYoutubeTrailerState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.trailers.length,
              itemBuilder: (_, index) =>
                  _buildTrailerItem(state.trailers[index]),
            );
          }

          if (state is EmptyMDYoutubeTrailerState) {
            return Center(child: Text('empty'));
          }

          if (state is ErrorMDYoutubeTrailerState) {
            return Center(child: Text('error'));
          }
        },
      ),
    );
  }

  Widget _buildTrailerItem(MDYoutubeTrailer trailer) {
    return Container(
      width: 170.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 2.0,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              width: 170.0,
              height: 110.0,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: trailer.thumbnailUrl,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.play_circle_filled,size: 50.0, color: Colors.redAccent.withOpacity(0.6)),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                        child: InkWell(
                          onTap: () { print('youtube: ${trailer.id}'); },
                        ),
                      ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              trailer.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Lato-Bold'
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    
    _mdYoutubeTrailerBloc.dispose();
    super.dispose();
  }
}
