part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class OnGetMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class OnPaginateGetMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}
