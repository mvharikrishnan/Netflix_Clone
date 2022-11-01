import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/backgroundCardWidget.dart';
import 'package:netflix_clone/presentation/home/widgets/numberTitleCardRF.dart';
import 'package:netflix_clone/presentation/widgets/mainTitleCard.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: ScrollNotifier,
          builder: (context, value, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection UserScrollDirection =
                    notification.direction;
                log(UserScrollDirection.toString());
                if (UserScrollDirection == ScrollDirection.reverse) {
                  ScrollNotifier.value = false;
                } else if (UserScrollDirection == ScrollDirection.forward) {
                  ScrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      BackgroundCardWidget(),
                      kHeight,
                      MainTitleCard(
                        MainCardTitle: 'Release in the past yeat',
                      ),
                      kHeight,
                      MainTitleCard(
                        MainCardTitle: 'Trending Now',
                      ),
                      kHeight,
                      NumberTitleCardRF(),
                      kHeight,
                      MainTitleCard(
                        MainCardTitle: 'Tense Dramas',
                      ),
                      kHeight,
                      MainTitleCard(
                        MainCardTitle: 'South Indian Cinemas',
                      ),
                      kHeight,
                    ],
                  ),
                  ScrollNotifier.value == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            height: 100,
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "https://pngset.com/images/netflix-logo-circle-word-text-symbol-trademark-transparent-png-1159007.png"),
                                    ),
                                    Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    kWidth,
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                                kHeight,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text('Tv Shows', style: kHomeTextStyle),
                                    Text('Movies', style: kHomeTextStyle),
                                    Text('Categories', style: kHomeTextStyle)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : kHeight
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
