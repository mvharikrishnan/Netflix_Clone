import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/commingSoonWidget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyonesWatchingWidget.dart';
import 'package:netflix_clone/presentation/widgets/videoWidget.dart';

import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class Screen_new_and_laugh extends StatelessWidget {
  const Screen_new_and_laugh({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: AppBar(
                title: const Text(
                  "New & Hot",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                actions: [
                  const Icon(
                    Icons.cast,
                    color: Colors.white,
                    size: 30,
                  ),
                  kWidth,
                  Container(
                    width: 30,
                    height: 20,
                    color: Colors.blue,
                  ),
                ],
                bottom: TabBar(
                    labelColor: kColorBlack,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    unselectedLabelColor: kWhiteColor,
                    indicator: BoxDecoration(
                        color: kWhiteColor, borderRadius: KRadius30),
                    tabs: const [
                      Tab(
                        text: "🍿 Comming Soon",
                      ),
                      Tab(
                        text: "👀 Everyone's watching",
                      )
                    ]),
              ),
            ),
            body: TabBarView(children: [
              _buildCommingSoon(),
              _buildEveryonesWatching(),
            ])),
      ),
    );
  }

  Widget _buildCommingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CommingSoonWigdet();
      },
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const everyonesWatchingWidget();
      },
    );
  }
}
