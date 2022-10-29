import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/downloads/screen_download.dart';
import 'package:netflix_clone/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_and_laugh.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

final List _pages = [
  ScreenHome(),
  Screen_new_and_laugh(),
  Screen_fast_laugh(),
  Screen_Search(),
  Screen_download(),
];


class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, index, _) {
        return _pages[index];
      },),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
