import 'package:flutter/material.dart';

class MovieOverview extends StatefulWidget {

  final String overview;

  const MovieOverview({Key key, this.overview}) : super(key: key);
  @override
  _MovieOverviewState createState() => _MovieOverviewState();
}

class _MovieOverviewState extends State<MovieOverview> {

  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    String overview = widget.overview;
    int maxLength = 70;
    if (overview.length > maxLength) {

      firstHalf = overview.substring(0, maxLength);
      secondHalf = overview.substring(maxLength, overview.length);
    } else {

      firstHalf = overview;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: secondHalf.isEmpty
              ? Text(firstHalf)
              : Column(
                children: <Widget>[
                  Text(
                    flag ? (firstHalf + '...') : (firstHalf + secondHalf),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14.0,
                      letterSpacing: 1.5
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => setState(() {
                          flag = !flag;
                        }),
                        child: Text(
                          flag ? 'show more' : 'show less',
                          style: TextStyle(fontFamily: 'Lato-Bold'),
                        )
                      )
                    ],
                  )
                ],
              )
    );
  }
}