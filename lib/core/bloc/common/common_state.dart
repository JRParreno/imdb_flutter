import 'package:equatable/equatable.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/fan_favorite_bloc/fan_favorite_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/genre_bloc/genre_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/movie_bloc/home_movies_bloc.dart';
import 'package:flutter_imdb/features/home/presentation/bloc/tv_shows_bloc/tv_shows_bloc.dart';
import 'package:flutter_imdb/features/movies/presentation/bloc/movie_bloc/movies_bloc.dart';

abstract class CommonState extends Equatable
    implements
        GenreState,
        MoviesState,
        TvShowsState,
        FanFavoriteState,
        HomeMoviesState {
  const CommonState();
  @override
  List<Object> get props => [];
}

// initial state for all blocs
class InitialState extends CommonState {
  const InitialState();
}

// loading state for all blocs
class LoadingState extends CommonState {
  const LoadingState();
}

class ErrorState extends CommonState {
  final String error;
  const ErrorState(this.error);
  @override
  List<Object> get props => [error];
}

class NoInternetConnectionState extends CommonState {
  const NoInternetConnectionState();
}

class ServerExceptionState extends CommonState {
  final String error;
  const ServerExceptionState(this.error);

  @override
  List<Object> get props => [error];
}

class TimeoutExceptionState extends CommonState {
  final String error;
  const TimeoutExceptionState(this.error);

  @override
  List<Object> get props => [error];
}
