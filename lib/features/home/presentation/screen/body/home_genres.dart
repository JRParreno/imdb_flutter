import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/bloc/common/common_state.dart';
import 'package:flutter_imdb/core/widgets/button/pill_button.dart';
import 'package:flutter_imdb/features/genres/presentation/genres_page.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/genre_bloc/genre_bloc.dart';
import 'package:gap/gap.dart';

class HomeGenres extends StatelessWidget {
  const HomeGenres({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return SizedBox(
      height: 70,
      width: double.infinity,
      child: BlocBuilder<GenreBloc, GenreState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is ErrorState) {
            return const Text('Something went wrong');
          }

          if (state is GenreLoaded) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: themeContext.textTheme.titleLarge,
                    ),
                    GestureDetector(
                      child: Text(
                        'View All',
                        style: themeContext.textTheme.labelMedium
                            ?.apply(color: Colors.orange),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          GenresPage.routeName,
                          arguments: GenresArguments(state.genreModel.data),
                        );
                      },
                    ),
                  ],
                ),
                const Gap(10),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.genreModel.data.popularGenres.length,
                    itemBuilder: (context, index) {
                      final genre = state.genreModel.data.popularGenres[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: PillButton(
                          title: genre,
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
