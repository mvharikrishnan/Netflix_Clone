import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/domain/downloads/models/downloadsModel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads moviedata;

  const VideoListItemInheritedWidget(
      {required this.widget, required this.moviedata, Key? key})
      : super(child: widget, key: key);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.moviedata != moviedata;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class Video_list_item extends StatelessWidget {
  const Video_list_item({required this.index, super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPathForFastAndLaugh =
        VideoListItemInheritedWidget.of(context)?.moviedata.posterPath;
    final videoUrl = dummyvideosUrls[index % dummyvideosUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (isPlayling) {},
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
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPathForFastAndLaugh == Null
                            ? null
                            : NetworkImage(
                                "$imageAppend_URL$posterPathForFastAndLaugh"),
                      ),
                    ),
                    VideoListItemsAction(
                        icons: Icons.emoji_emotions_outlined, Title: 'LOL'),
                    VideoListItemsAction(icons: Icons.add, Title: 'My List'),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.moviedata
                                .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: VideoListItemsAction(
                          icons: CupertinoIcons.paperplane, Title: 'Share'),
                    ),
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlayling) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              )
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
  }
}
