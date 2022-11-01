import 'package:netflix_clone/core/constants.dart';
import 'package:flutter/material.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
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
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/original/nUHk72rSGDuG2Lz22zJAYCyxq7g.jpg'),
        ),
      ),
    );
  }
}
