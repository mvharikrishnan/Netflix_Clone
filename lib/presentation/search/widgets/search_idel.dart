import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/searchScreenTitle.dart';

const searchBackgroundImage =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/n7EAxtBN6qsNn3BN87dtbamDcV7.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchScreenTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
            itemBuilder: (ctx, index) => const TopSearchItemTile(),
            separatorBuilder: (ctx, index) => kHeight20,
            itemCount: 10,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 70,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://repository-images.githubusercontent.com/405033258/1bd6a04a-8eeb-4352-a8a8-249004c865fa'))),
        ),
        Expanded(
          child: const Text(
            'Movie Name',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
        Icon(
          CupertinoIcons.play_circle,
          color: kWhiteColor,
          size: 50,
        )
      ],
    );
  }
}
