import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

import 'numberCard.dart';
class NumberTitleCardRF extends StatelessWidget {
  const NumberTitleCardRF({
    required this.postersList,
    Key? key,
  }) : super(key: key);
final List<String> postersList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(title: 'Top 10 Tv Shows in India Today'),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Number_Card(
                      Index: index + 1, imageURL: postersList[index],
                    ),
                separatorBuilder: (context, index) => kWidth,
                itemCount: postersList.length),
          ),
        ),
      ],
    );
  }
}