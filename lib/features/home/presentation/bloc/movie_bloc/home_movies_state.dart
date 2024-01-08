part of 'home_movies_bloc.dart';

abstract class HomeMoviesState extends Equatable {
  const HomeMoviesState();
}

class HomeMoviesLoaded extends HomeMoviesState {
  final MovieModel movieModel;
  final bool isPaginate;

  const HomeMoviesLoaded({
    required this.movieModel,
    this.isPaginate = false,
  });

  @override
  List<Object?> get props => [
        movieModel,
        isPaginate,
      ];
}
