import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What Movies',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}