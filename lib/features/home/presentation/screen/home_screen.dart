import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/utils/spacing/v_space.dart';
import 'package:flutter_imdb/features/fan_favorites/data/datasources/fan_favorite_repository_impl.dart';
import 'package:flutter_imdb/features/genres/data/datasources/genre_repository_impl.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/fan_favorite_bloc/fan_favorite_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/genre_bloc/genre_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/movie_bloc/home_movies_bloc.dart';
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
  final HomeMoviesBloc homeMoviesBloc = HomeMoviesBloc(MovieRepositoryImpl());
  final TvShowsBloc tvShowsBloc = TvShowsBloc(TVShowRepositoryImpl());
  final FanFavoriteBloc fanFavoriteBloc =
      FanFavoriteBloc(FanFavoriteRepositoryImpl());

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
          create: (context) => homeMoviesBloc,
        ),
        BlocProvider(
          create: (context) => tvShowsBloc,
        ),
        BlocProvider(
          create: (context) => fanFavoriteBloc,
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
                    // const HomeFanFavorites(),
                    // Vspace.md,
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
    homeMoviesBloc.add(OnGetHomeMoviesEvent());
    tvShowsBloc.add(OnGetTvShowsEvent());
    fanFavoriteBloc.add(OnGetFanFavoritesEvent());
  }
}
