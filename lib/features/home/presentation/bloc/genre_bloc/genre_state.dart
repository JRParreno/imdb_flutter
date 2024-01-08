part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();
}

class GenreLoaded extends GenreState {
  final GenreModel genreModel;

  const GenreLoaded(this.genreModel);

  @override
  List<Object?> get props => [genreModel];

  GenreLoaded copyWith({
    GenreModel? genreModel,
  }) {
    return GenreLoaded(
      genreModel ?? this.genreModel,
    );
  }
}
