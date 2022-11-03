import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class Number_Card extends StatelessWidget {
  const Number_Card({super.key, required this.Index, required this.imageURL});
  final String imageURL;
  final int Index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: KRadius,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      imageURL),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -20,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 10.0,
            child: Text(
              Index.toString(),
              style: TextStyle(
                  fontSize: 140,
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
