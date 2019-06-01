import 'package:flutter/material.dart';

import 'package:whats_movies/domains/movie.dart';

class TrendingList extends StatefulWidget {
  @override
  _TrendingListState createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {

  List<Movie> _sampleData = [
    Movie(
      title: 'Captain Marvel',
    ),
    Movie(
      title: 'Captive State',
    ),
    Movie(
      title: 'Game of Thrones',
    ),
    Movie(
      title: 'Aladdin',
    ),
  ];

  List<String> _sampleImage = [
    'assets/images/captain_marvel.jpg',
    'assets/images/captive_state.jpg',
    'assets/images/got.jpg',
    'assets/images/aladin.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.0,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {

          return _buildTrendingItem(
            _sampleData[index],
            _sampleImage[index]
          );
        },
      ),
    );
  }

  Widget _buildTrendingItem(Movie movie, String path) {

    return Container(
      width: 255.0,
      child: Card(
        elevation: 3.5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Stack(
          children: <Widget>[
            Image.asset(
              path,
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
    );
  }
}