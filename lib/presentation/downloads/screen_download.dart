import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/string.dart';

import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

// final List<String> ImageList = [
//   "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg"
//       'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/gLnrBoSENk32SKjHDiZv7E4zwzK.jpg'
//       'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/7qop80YfuO0BwJa1uXk1DXUUEwv.jpg'
// ];

class Screen_download extends StatelessWidget {
  Screen_download({super.key});
  final _WidgetsList = [
    const _SmartDownloads(),
    const Section_two(),
    const Section_Three()
  ];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              Title: 'Downloads',
            ),
          ),
          body: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => _WidgetsList[index],
              separatorBuilder: (context, index) => const SizedBox(
                    height: 30,
                  ),
              itemCount: _WidgetsList.length)),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: const [
          Icon(
            Icons.settings,
            color: kWhiteColor,
          ),
          kWidth,
          Text('Smart Downloads')
        ],
      ),
    );
  }
}

class Section_two extends StatelessWidget {
  const Section_two({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          'We will download a personalised selection of movies and shows,for you so there is \n always something to watch on your \n device',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.4,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                        downloadsImageWidjet(
                          borderRadius: 10,
                          size: Size(size.width * 0.35, size.width * 0.55),
                          margin: const EdgeInsets.only(left: 170, top: 50),
                          ThumbNailImage:
                              '$imageAppend_URL${state.downloads[0].posterPath}',
                          rotation: 20,
                        ),
                        downloadsImageWidjet(
                            borderRadius: 10,
                            size: Size(size.width * 0.35, size.width * 0.55),
                            margin: const EdgeInsets.only(right: 170, top: 50),
                            ThumbNailImage:
                                '$imageAppend_URL${state.downloads[1].posterPath}',
                            rotation: -20),
                        downloadsImageWidjet(
                            borderRadius: 10,
                            size: Size(size.width * 0.45, size.width * 0.65),
                            margin: const EdgeInsets.only(bottom: 35, top: 50),
                            ThumbNailImage:
                                '$imageAppend_URL${state.downloads[2].posterPath}',
                            rotation: 0)
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section_Three extends StatelessWidget {
  const Section_Three({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MaterialButton(
              color: kColorBlue,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Setup',
                  style: TextStyle(
                      color: kColorWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'See What you can download',
              style: TextStyle(
                color: kColorBlack,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class downloadsImageWidjet extends StatelessWidget {
  const downloadsImageWidjet({
    required this.borderRadius,
    required this.ThumbNailImage,
    required this.rotation,
    required this.margin,
    required this.size,
    Key? key,
  }) : super(key: key);

  final double rotation;
  final String ThumbNailImage;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: rotation * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            // margin: margin,
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(ThumbNailImage),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
