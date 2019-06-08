import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_movies/blocs/fetch_trendings/bloc.dart';
import 'package:whats_movies/domains/movie.dart';

class TrendingList extends StatefulWidget {
  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  FetchtrendingsBloc _trendingsBloc;

  @override
  void initState() {
    super.initState();

    _trendingsBloc = BlocProvider.of<FetchtrendingsBloc>(context);
    _trendingsBloc.dispatch(FetchTrendings());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.0,
      child: BlocBuilder(
        bloc: _trendingsBloc,
        builder: (BuildContext context, FetchtrendingsState state) {
          if (state is TrendingsUnitilized) {

            return Center(child: CircularProgressIndicator());
          }

          if (state is TrendingsLoaded) {
            return ListView.builder(
              itemCount: state.trendings.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return _buildTrendingItem(state.trendings[index]);
              },
            );
          }

          if (state is TrendingsError) {

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () => _trendingsBloc.dispatch(FetchTrendings()),
                    icon: Icon(Icons.refresh, size: 35.0)
                  ),
                  Text(
                    'Reload Trendings',
                    style: TextStyle(
                      fontFamily: 'Lato'
                    ),
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
    return Container(
      width: 255.0,
      child: Card(
        elevation: 3.5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
                            offset: Offset(2.0, 2.0))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
