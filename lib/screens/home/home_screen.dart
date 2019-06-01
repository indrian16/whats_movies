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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
              child: HomeSearchBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TrendingList(),
            ),
          ],
        ),
      ),
    );
  }
}