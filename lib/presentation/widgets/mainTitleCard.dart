import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_card_widget.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    required this.posterList,
    required this.MainCardTitle,
    Key? key,
  }) : super(key: key);
  final String MainCardTitle;
  final List<String> posterList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(title: MainCardTitle),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MainCardWidget(
                      imageUrl: posterList[index],
                    ),
                separatorBuilder: (context, index) => kWidth,
                itemCount: posterList.length),
          ),
        ),
      ],
    );
  }
}
