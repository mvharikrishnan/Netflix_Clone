import 'package:flutter/material.dart';

import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

final List _download_images = [
  'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/9BAjt8nSSms62uOVYn1t3C3dVto.jpg'
      'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/gLnrBoSENk32SKjHDiZv7E4zwzK.jpg'
      'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/7qop80YfuO0BwJa1uXk1DXUUEwv.jpg'
];

class Screen_download extends StatelessWidget {
  const Screen_download({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            Title: 'Downloads',
          ),
        ),
        body: ListView(
        children: [
          Row(children: [
            Icon(Icons.settings)
          ],)
        ],
        )
      ),
    );
  }
}
