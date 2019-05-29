import 'package:flutter/material.dart';

class MainSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: TextField(
        onTap: () {
          print('goSearch()');
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.black),
            hintText: 'Search',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.black, width: 1.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.black, width: 1.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                borderSide: BorderSide(color: Colors.black, width: 1.5))
        ),
      ),
    );
  }
}
