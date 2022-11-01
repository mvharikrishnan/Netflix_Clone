import 'package:flutter/cupertino.dart';

import 'package:netflix_clone/core/constants.dart';

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: kWhiteColor),
    );
  }
}
