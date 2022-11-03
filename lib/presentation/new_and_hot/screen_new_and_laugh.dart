import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hotAndNew/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/string.dart';
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
          body: const TabBarView(children: [
            CommingSoonList(
              key: Key('comming_soon'),
            ),
            EveryonesWatchingList(
              key: Key('everyone_watching'),
            )
          ]),
        ),
      ),
    );
  }
}

class CommingSoonList extends StatelessWidget {
  const CommingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInCommingSoon());
    });
    return RefreshIndicator(
      onRefresh: ()async {
        BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInCommingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(child: Text('Error'));
          } else if (state.commingsoonList.isEmpty) {
            return const Center(child: Text('Comming Soon List Is Empty'));
          } else {
            return ListView.builder(
              itemCount: state.commingsoonList.length,
              itemBuilder: (context, index) {
                final movie = state.commingsoonList[index];
                if (movie.id == null) {
                  SizedBox();
                }
                final _date = DateTime.parse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMd('en_US').format(_date);
                return CommingSoonWigdet(
                  id: movie.id.toString(),
                  month: formatedDate.split(' ').first.substring(0, 3),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$imageAppend_URL${movie.posterPath}',
                  moveName: movie.originalTitle ?? 'No Title',
                  descption: movie.overview ?? 'Description not Available 404',
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(LoadDataInEveryonesWatching());
    });
    return RefreshIndicator(
      onRefresh: ()async {
        BlocProvider.of<HotAndNewBloc>(context)
          .add(LoadDataInEveryonesWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.hasError) {
            return const Center(child: Text('Error'));
          } else if (state.everyoneswatchingList.isEmpty) {
            return const Center(child: Text('Comming Soon List Is Empty'));
          } else {
            return ListView.builder(
              itemCount: state.everyoneswatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyoneswatchingList[index];
                if (tv.id == null) {
                  SizedBox();
                }
                // final _date = DateTime.parse(tv.releaseDate!);
                // final formatedDate = DateFormat.yMMMd('en_US').format(_date);
                return everyonesWatchingWidget(
                  posterPath: '$imageAppend_URL${tv.posterPath}',
                  moveName: tv.originalName ?? 'No Title',
                  descption: tv.overview ?? 'Description not Available 404',
                );
              },
            );
          }
        },
      ),
    );
  }
}
