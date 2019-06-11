import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:whats_movies/domains/people.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  List<People> _sampleData = [
    People(
        name: 'Robert Downey Jr.',
        profileUrl:
            'https://image.tmdb.org/t/p/w185/1YjdSym1jTG7xjHSI0yGGWEsw5i.jpg',
        films: ['The Avengers', 'Iron Man', 'Iron Man 3']),
    People(
        name: 'Emilia Clarke',
        profileUrl:
            'https://image.tmdb.org/t/p/w185/lRSqMNNhPL4Ib1hAJxmDFBXHAMU.jpg',
        films: ['Game of Thrones', 'Me Before You', 'Terminator Genisys']),
    People(
        name: 'Sophie Turner',
        profileUrl:
            'https://image.tmdb.org/t/p/w185/ed4ajSYdv49j9OF7yMeG8Hznrrt.jpg',
        films: ['X-Men: Apocalypse', 'Game of Thrones', 'Barely Lethal']),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: _sampleData.length,
          itemBuilder: (_, index) {
            return _buildPeopleItem(_sampleData[index]);
          },
        ));
  }

  _buildPeopleItem(People people) {
    return Card(
      elevation: 3.0,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        height: 100.0,
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: people.profileUrl,
              width: 80.0,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      people.name,
                      style: TextStyle(fontFamily: 'Lato-Bold', fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      people.filmToString(),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: 'Lato', fontSize: 13.0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
