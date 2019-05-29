import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'bloc_delegate.dart';
import 'screens/screens.dart';

void main() {

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