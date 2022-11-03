import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/videoWidget.dart';

class CommingSoonWigdet extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String moveName;
  final String descption;

  const CommingSoonWigdet(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.moveName,
      required this.descption});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                kHeight,
                Text(
                  month,
                  style: kHomeTextStyleListViewDate,
                ),
                Text(
                  day,
                  style: kHomeTextStyleListViewDate,
                )
              ],
            ),
          ),
          SizedBox(
            width: Size.width - 50,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(ImageUrl: posterPath),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        moveName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.alarm,
                                  color: kWhiteColor,
                                )),
                            Text(
                              'Remind Me',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.info_outline,
                                  color: kWhiteColor,
                                )),
                            Text(
                              'Info',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Text('Comming On $month $day'),
                kHeight,
                Text(
                  moveName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                kHeight,
                Text(
                  descption,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
