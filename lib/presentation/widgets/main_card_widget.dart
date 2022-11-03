import 'package:netflix_clone/core/constants.dart';
import 'package:flutter/material.dart';

class MainCardWidget extends StatelessWidget {
  final String imageUrl;
  const MainCardWidget({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: KRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
