import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'di/injection_container.dart';
import 'package:whats_movies/blocs/bloc_delegate.dart';
import 'screens/screens.dart';

void main() {

  eatKiwi();
  BlocSupervisor.delegate = MyBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What Movies',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: MainScreen(),
    );
  }
}