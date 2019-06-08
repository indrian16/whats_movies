import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TrendingList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Popular',
                          style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontSize: 18.0,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            print('goMorePopularMovie()');
                          },
                          child: Text(
                            'See all >',
                            style: TextStyle(
                                fontFamily: 'Lato', color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  PopularList()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Upcoming',
                          style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontSize: 18.0,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            print('goMorePopularMovie()');
                          },
                          child: Text(
                            'See all >',
                            style: TextStyle(
                                fontFamily: 'Lato', color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  UpcomingList(),
                  SizedBox(height: 16.0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
