import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {

  final double height;

  const HorizontalLine({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: height != null ? height : 1.0,
        color: Colors.grey,
      ),
    );
  }
}