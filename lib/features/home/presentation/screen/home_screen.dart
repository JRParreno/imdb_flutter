import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/utils/spacing/v_space.dart';
import 'package:flutter_imdb/features/genres/data/datasources/genre_repository_impl.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/genre_bloc/genre_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/movie_bloc/movies_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/tv_shows_bloc/tv_shows_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/screen/body/home_genres.dart';
import 'package:flutter_imdb/features/home/presentation/screen/body/home_header.dart';
import 'package:flutter_imdb/features/home/presentation/screen/body/home_popular_movie.dart';
import 'package:flutter_imdb/features/home/presentation/screen/body/home_popular_tv_shows.dart';
import 'package:flutter_imdb/features/home/presentation/screen/body/home_searchbar.dart';
import 'package:flutter_imdb/features/movies/data/datasources/movie_repository_impl.dart';
import 'package:flutter_imdb/features/tv_shows/data/datasources/tv_show_repository_impl.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final GenreBloc genreBloc = GenreBloc(GenreRepositoryImpl());
  final MoviesBloc moviesBloc = MoviesBloc(MovieRepositoryImpl());
  final TvShowsBloc tvShowsBloc = TvShowsBloc(TVShowRepositoryImpl());

  @override
  void initState() {
    initBlocs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => genreBloc,
        ),
        BlocProvider(
          create: (context) => moviesBloc,
        ),
        BlocProvider(
          create: (context) => tvShowsBloc,
        ),
      ],
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeHeader(),
                    Vspace.md,
                    HomeSearchbar(controller: searchController),
                    Vspace.md,
                    const HomeGenres(),
                    Vspace.lg,
                    const HomePopularMovies(),
                    Vspace.md,
                    const HomePopularTVShows(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initBlocs() {
    genreBloc.add(OnGetGenreEvent());
    moviesBloc.add(OnGetMoviesEvent());
    tvShowsBloc.add(OnGetTvShowsEvent());
  }
}
