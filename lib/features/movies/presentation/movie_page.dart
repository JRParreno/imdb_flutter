import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/bloc/common/common_state.dart';
import 'package:flutter_imdb/core/utils/spacing/v_space.dart';
import 'package:flutter_imdb/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_imdb/features/movies/data/datasources/movie_repository_impl.dart';

import 'package:flutter_imdb/features/movies/presentation/bloc/movie_bloc/movies_bloc.dart';
import 'package:flutter_imdb/features/movies/presentation/widgets/movie_card.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  static const String routeName = '/movies';

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final MoviesBloc moviesBloc = MoviesBloc(MovieRepositoryImpl());

  @override
  void initState() {
    initBlocs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return BlocProvider(
      create: (context) => moviesBloc,
      child: Scaffold(
        appBar: customAppBar(
          title: 'Movies',
          context: context,
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
          width: double.infinity,
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is ErrorState) {
                return Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50,
                    ),
                    Vspace.sm,
                    const Text('Something went wrong.'),
                  ],
                ));
              }

              if (state is LoadingState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      Vspace.sm,
                      Text(
                        'Loading please wait...',
                        style: themeContext.textTheme.labelMedium,
                      ),
                    ],
                  ),
                );
              }

              if (state is MoviesLoaded) {
                return SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    runSpacing: 30,
                    children: state.movieModel.movies.data.list
                        .map(
                          (data) => MovieCard(
                            movie: data.title,
                          ),
                        )
                        .toList()
                        .cast<Widget>(),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void initBlocs() {
    moviesBloc.add(OnGetMoviesEvent());
  }
}
