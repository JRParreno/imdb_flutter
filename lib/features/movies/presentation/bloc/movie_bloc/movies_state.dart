part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesLoaded extends MoviesState {
  final MovieModel movieModel;
  final bool isPaginate;

  const MoviesLoaded({
    required this.movieModel,
    this.isPaginate = false,
  });

  @override
  List<Object?> get props => [
        movieModel,
        isPaginate,
      ];
}
