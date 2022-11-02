import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/fastLaugh/fast_laugh_bloc.dart';

import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list_item.dart';

class Screen_fast_laugh extends StatelessWidget {
  const Screen_fast_laugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialise());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return Center(
                child: Text("Error While Getting Data"),
              );
            } else if (state.videosList.isEmpty) {
              return const Center(
                child: Text('Video List is Empty'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                    state.videosList.length,
                    (index) => VideoListItemInheritedWidget(
                        widget: Video_list_item(index: index,key: Key(index.toString()),),
                        moviedata: state.videosList[index])),
              );
            }
          },
        ),
      ),
    );
  }
}
