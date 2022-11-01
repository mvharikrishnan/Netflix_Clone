import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/backgroundCardWidget.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_Buttom_widget.dart';
import 'package:netflix_clone/presentation/home/widgets/numberCard.dart';
import 'package:netflix_clone/presentation/home/widgets/numberTitleCardRF.dart';
import 'package:netflix_clone/presentation/widgets/mainTitleCard.dart';
import 'package:netflix_clone/presentation/widgets/main_card_widget.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
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
                    ? Container(
                        height: 80,
                        width: double.infinity,
                        color:Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              children: [

                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight
              ],
            ),
          );
        },
      ),
    );
  }
}
