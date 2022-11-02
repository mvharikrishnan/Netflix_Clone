import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/searchScreenTitle.dart';

class Search_result_Widget extends StatelessWidget {
  const Search_result_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchScreenTitle(title: 'Movies & Tv'),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.4,
                children: List.generate(state.searchResultList.length, (index) {
                  final movie = state.searchResultList[index];
                  return MainMovieCard(
                    imageURL: movie.posterImageUrl,
                  );
                }),
                shrinkWrap: true,
                crossAxisCount: 3,
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainMovieCard extends StatelessWidget {
  final String imageURL;
  const MainMovieCard({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image:
            DecorationImage(image: NetworkImage(imageURL), fit: BoxFit.cover),
      ),
    );
  }
}
