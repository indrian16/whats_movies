import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  
  final int id;

  const MovieDetailPage({Key key, this.id}) : super(key: key);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {

  @override
  void initState() {
    super.initState();
    print('detail movie: ${widget.id}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}