import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/bloc/common/common_state.dart';
import 'package:flutter_imdb/features/genres/data/models/genre_model.dart';
import 'package:flutter_imdb/features/home/domain/repositories/genre_repository.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GenreRepository _genreRepository;
  GenreBloc(this._genreRepository) : super(const InitialState()) {
    on<OnGetGenreEvent>(onGetGenreEvent);
  }

  Future<void> onGetGenreEvent(
      OnGetGenreEvent event, Emitter<GenreState> emit) async {
    emit(const LoadingState());
    try {
      final genres = await _genreRepository.getGenres();

      emit(GenreLoaded(genres));
    } catch (e) {
      emit(const ErrorState('Error'));
    }
  }
}
