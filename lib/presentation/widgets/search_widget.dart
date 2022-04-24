import 'package:flutter/material.dart';

class SearchFinder extends StatelessWidget {
  final String query;
  const SearchFinder({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(query),
    );
  }
}
