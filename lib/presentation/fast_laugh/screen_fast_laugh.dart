import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list_item.dart';

class Screen_fast_laugh extends StatelessWidget {
  const Screen_fast_laugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
              20,
              (index) => Video_list_item(
                    index: index,
                  )),
        ),
      ),
    );
  }
}
