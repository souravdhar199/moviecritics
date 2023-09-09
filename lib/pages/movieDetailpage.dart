import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final dynamic title;

  // const MovieDetail({Key? key, required this.data}) : super(key: key);

  const MovieDetail({Key? key, required this.title}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title); // Access data through the widget
  }
}
