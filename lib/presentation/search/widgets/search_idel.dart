import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/presentation/search/widgets/searchScreenTitle.dart';

const searchBackgroundImage =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/n7EAxtBN6qsNn3BN87dtbamDcV7.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchScreenTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error Occured while getting data'),
                );
              } else if (state.idelList.isEmpty) {
                return const Center(
                  child: Text('List is Empty'),
                );
              }
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final movie = state.idelList[index];
                  return TopSearchItemTile(
                    Title: movie.title ?? 'No Title',
                    Imageurl: '$imageAppend_URL${movie.posterPath}',
                  );
                },
                separatorBuilder: (ctx, index) => kHeight20,
                itemCount: state.idelList.length,
                shrinkWrap: true,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String Title;
  final String Imageurl;
  const TopSearchItemTile(
      {super.key, required this.Title, required this.Imageurl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 70,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(Imageurl))),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            Title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
        Icon(
          CupertinoIcons.play_circle,
          color: kWhiteColor,
          size: 50,
        )
      ],
    );
  }
}
