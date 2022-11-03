import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/videoWidget.dart';

class everyonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String moveName;
  final String descption;

  const everyonesWatchingWidget(
      {super.key,
      required this.posterPath,
      required this.moveName,
      required this.descption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
           Text(
            moveName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          kHeight,
           Text(
            descption,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          kHeight50,
          VideoWidget(
            ImageUrl: posterPath,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //might refactor it later
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.paperplane,
                        color: kWhiteColor,
                        size: 30,
                      )),
                  Text('Share')
                ],
              ),
              kWidth,
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: kWhiteColor,
                        size: 30,
                      )),
                  Text('My List')
                ],
              ),
              kWidth,
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        color: kWhiteColor,
                        size: 30,
                      )),
                  Text('Play')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
