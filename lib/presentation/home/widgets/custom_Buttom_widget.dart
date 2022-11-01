import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class CustomButtomWidget extends StatelessWidget {
  const CustomButtomWidget({
    required this.IconTitle,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String IconTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 30,
        ),
        Text(
          IconTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
