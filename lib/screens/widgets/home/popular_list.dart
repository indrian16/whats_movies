import 'package:flutter/material.dart';

import 'package:whats_movies/domains/movie.dart';

class PopularList extends StatefulWidget {
  @override
  _PopularListState createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  List<Movie> _sampleData = [
    Movie(
        title: 'Captain Marvel',
        backdropPath: 'assets/images/p_captain_marvel.jpg',
        voteAverage: 7.1),
    Movie(
        title: 'Captive State',
        backdropPath: 'assets/images/p_captive_state.jpg',
        voteAverage: 4.8),
    Movie(
        title: 'Game of Thrones',
        backdropPath: 'assets/images/p_got.jpg',
        voteAverage: 8.1),
    Movie(
        title: 'Aladdin',
        backdropPath: 'assets/images/p_aladdin.jpg',
        voteAverage: 7.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return _buildPopularItem(_sampleData[index]);
        },
      ),
    );
  }

  Widget _buildPopularItem(Movie movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 135.0,
          height: 180.0,
          child: Card(
            elevation: 3.0,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  movie.backdropPath,
                  width: double.infinity,
                  fit: BoxFit.fill,
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
        Text(
          movie.title,
          style: TextStyle(fontFamily: 'Lato'),
        )
      ],
    );
  }
}
