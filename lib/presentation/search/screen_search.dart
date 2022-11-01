import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idel.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result_page.dart';

class Screen_Search extends StatelessWidget {
  const Screen_Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: kWhiteColor),
              backgroundColor: Colors.grey.withOpacity(0.4),
            ),
            kHeight,
          //  const Expanded(child:  SearchIdleWidget()),
          const Expanded(child:  Search_result_Widget()),
          ],
        ),
      )),
    );
  }
}
