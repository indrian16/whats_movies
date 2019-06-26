import 'package:flutter/material.dart';

import 'package:whats_movies/domains/movie_detail.dart';
import 'package:whats_movies/screens/widgets/movie_detail/movie_details.dart';

class InfoTab extends StatefulWidget {

  final MovieDetail movieDetail;

  const InfoTab({Key key, this.movieDetail}) : super(key: key);

  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Overview',
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontSize: 18.0
                  ),
                ),
                SizedBox(height: 8.0),
                MovieOverview(overview: widget.movieDetail.overview)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: HorizontalLine(height: 1.5),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Trailers',
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontSize: 18.0
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          TrailerList(id: widget.movieDetail.id),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: HorizontalLine(height: 1.5),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Media',
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontSize: 18.0
                  ),
                ),
                SizedBox(height: 16.0),
                MediaItem(id: widget.movieDetail.id)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: HorizontalLine(height: 1.5),
          ),
        ],
      ),
    );
  }
}