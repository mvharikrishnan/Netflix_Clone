import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_Buttom_widget.dart';

class BackgroundCardWidget extends StatelessWidget {
  const BackgroundCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 700,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(KMainImage),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtomWidget(
                  icon: Icons.add,
                  IconTitle: "My List",
                ),
                _PlayButton(),
                const CustomButtomWidget(
                  IconTitle: "Info",
                  icon: Icons.info_outline,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: kColorBlack,
        size: 25,
      ),
      label: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(
            color: kColorBlack,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
