import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/constants.dart';

class Video_list_item extends StatelessWidget {
  const Video_list_item({required this.index, super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left Side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.volume_off,
                      color: kWhiteColor,
                    ),
                  ),
                ),

                //Right Side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('https://www.themoviedb.org/t/p/w220_and_h330_face/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg'),
                      ),
                    ),
                    VideoListItemsAction(
                        icons: Icons.emoji_emotions_outlined, Title: 'LOL'),
                    VideoListItemsAction(icons: Icons.add, Title: 'My List'),
                    VideoListItemsAction(
                        icons: CupertinoIcons.paperplane, Title: 'Share'),
                    VideoListItemsAction(
                        icons: CupertinoIcons.play_arrow_solid, Title: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoListItemsAction extends StatelessWidget {
  const VideoListItemsAction(
      {super.key, required this.icons, required this.Title});
  final IconData icons;
  final String Title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(
            icons,
            color: kColorWhite,
            size: 30,
          ),
          Text(
            Title,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
