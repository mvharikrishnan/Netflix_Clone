import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class SearchScreenTitle extends StatelessWidget {
  const SearchScreenTitle({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Text(
     title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: kWhiteColor),
    );
  }
}