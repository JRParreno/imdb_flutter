import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/bloc/common/common_state.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/movie_bloc/movies_bloc.dart';
import 'package:flutter_imdb/features/movies/presentation/widgets/movie_card.dart';
import 'package:gap/gap.dart';

class HomePopularMovies extends StatelessWidget {
  const HomePopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return SizedBox(
      height: 275,
      width: double.infinity,
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is ErrorState) {
            return const Text('Something went wrong');
          }

          if (state is MoviesLoaded) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Movies',
                      style: themeContext.textTheme.titleLarge,
                    ),
                    Text(
                      'View All',
                      style: themeContext.textTheme.labelMedium
                          ?.apply(color: Colors.orange),
                    ),
                  ],
                ),
                const Gap(10),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final movie =
                          state.movieModel.movies.data.list[index].title;
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: MovieCard(
                          movie: movie,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
