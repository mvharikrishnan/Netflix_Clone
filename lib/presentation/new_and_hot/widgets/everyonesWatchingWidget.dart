import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/videoWidget.dart';

class everyonesWatchingWidget extends StatelessWidget {
  const everyonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          'Friends',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "Friends is a 1971 British-French teen-romance film directed and produced by Lewis Gilbert and written by Gilbert, Vernon Harris and Jack Russell.",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        kHeight50,
        const VideoWidget(),
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
    );
  }
}
