import 'package:flutter/cupertino.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/searchScreenTitle.dart';

const imageURL =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/59SVNwLfoMnZPPB6ukW6dlPxAdI.jpg';

class Search_result_Widget extends StatelessWidget {
  const Search_result_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchScreenTitle(title: 'Movies & Tv'),
        kHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.4,
            children: List.generate(20, (index) {
              return MainMovieCard();
            }),
            shrinkWrap: true,
            crossAxisCount: 3,
          ),
        ),
      ],
    );
  }
}

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: const DecorationImage(
            image: NetworkImage(imageURL), fit: BoxFit.cover),
      ),
    );
  }
}