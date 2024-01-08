part of 'home_movies_bloc.dart';

abstract class HomeMoviesEvent extends Equatable {
  const HomeMoviesEvent();
}

class OnGetHomeMoviesEvent extends HomeMoviesEvent {
  @override
  List<Object?> get props => [];
}

class OnPaginateGetHomeMoviesEvent extends HomeMoviesEvent {
  @override
  List<Object?> get props => [];
}
