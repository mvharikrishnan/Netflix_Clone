import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/presentation/home/widgets/backgroundCardWidget.dart';
import 'package:netflix_clone/presentation/home/widgets/numberTitleCardRF.dart';
import 'package:netflix_clone/presentation/widgets/mainTitleCard.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      } else if (state.hasError) {
                        return const Center(
                          child: Text('Error Wile Collecting data'),
                        );
                      } else {
                        final _ReleasedPastYear =
                            state.pastyearMoviesList.map((m) {
                          return '$imageAppend_URL${m.posterPath}';
                        }).toList();
                        final _TrendingPastYear =
                            state.trendingMovieList.map((m) {
                          return '$imageAppend_URL${m.posterPath}';
                        }).toList();
                        final _TenseDramasPastYear = state.tenseDramas.map((m) {
                          return '$imageAppend_URL${m.posterPath}';
                        }).toList();
                        final _SouthIndianMovies =
                            state.southIndianMovieList.map((m) {
                          return '$imageAppend_URL${m.posterPath}';
                        }).toList();
                        final _PostersListMovies =
                            state.trendingTvList.map((m) {
                          return '$imageAppend_URL${m.posterPath}';
                        }).toList();
                        return ListView(
                          children: [
                            BackgroundCardWidget(),
                            kHeight,
                            MainTitleCard(
                              posterList: _ReleasedPastYear,
                              MainCardTitle: 'Release in the past yeat',
                            ),
                            kHeight,
                            MainTitleCard(
                              posterList: _TrendingPastYear,
                              MainCardTitle: 'Trending Now',
                            ),
                            kHeight,
                            NumberTitleCardRF(
                              postersList: _PostersListMovies,
                            ),
                            kHeight,
                            MainTitleCard(
                              posterList: _TenseDramasPastYear,
                              MainCardTitle: 'Tense Dramas',
                            ),
                            kHeight,
                            MainTitleCard(
                              posterList: _SouthIndianMovies,
                              MainCardTitle: 'South Indian Cinemas',
                            ),
                            kHeight,
                          ],
                        );
                      }
                    },
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
