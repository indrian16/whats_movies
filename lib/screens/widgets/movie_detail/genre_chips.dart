import 'package:flutter/material.dart';

import 'package:whats_movies/domains/movie_genre.dart';

class GenreChips extends StatelessWidget {

  final List<Genre> genres;

  const GenreChips({Key key, this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}