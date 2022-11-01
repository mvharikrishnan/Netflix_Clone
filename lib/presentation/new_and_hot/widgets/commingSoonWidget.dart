import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/videoWidget.dart';

class CommingSoonWigdet extends StatelessWidget {
  const CommingSoonWigdet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: const [
              kHeight,
              Text(
                'Feb',
                style: kHomeTextStyleListViewDate,
              ),
              Text(
                '11',
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
              VideoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cabinet Curiosities",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                          Text('Remind Me')
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
                          Text('Info')
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const Text('Comming On Firday'),
              kHeight,
              const Text(
                'Cabinet of Curiosities',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              kHeight,
              const Text(
                "Guillermo del Toro's Cabinet of Curiosities is currently available to stream in India. JustWatch makes it easy to find out where you can legally watch your favorite movies & TV shows online. Visit JustWatch for more information.",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
