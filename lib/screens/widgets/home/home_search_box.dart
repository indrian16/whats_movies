import 'package:flutter/material.dart';

class HomeSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: double.infinity,
      child: OutlineButton(
        onPressed: () { print('goSearch(Movies)'); },
        child: Row(
          children: <Widget>[
            Icon(Icons.search, color: Colors.black),
            SizedBox(width: 12.0),
            Text(
              'Search movies',
              style: TextStyle(
                fontFamily: 'Lato'
              ),
            )
          ],
        ),
        borderSide: BorderSide(color: Colors.black),
        highlightedBorderColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
      )
    );
  }
}
