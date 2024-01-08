import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/bloc/common/common_state.dart';
import 'package:flutter_imdb/features/movies/data/models/country.dart';
import 'package:flutter_imdb/features/movies/data/models/genres.dart';
import 'package:flutter_imdb/features/movies/data/models/imdb_filter_model.dart';
import 'package:flutter_imdb/features/movies/data/models/movie_model.dart';
import 'package:flutter_imdb/features/movies/data/models/release_date.dart';
import 'package:flutter_imdb/features/movies/data/models/run_time.dart';
import 'package:flutter_imdb/features/movies/data/models/user_ratings.dart';
import 'package:flutter_imdb/features/movies/domain/repositories/movie_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository _movieRepository;

  MoviesBloc(this._movieRepository) : super(const InitialState()) {
    on<OnGetMoviesEvent>(onGetMoviesEvent);
  }

  Future<void> onGetMoviesEvent(
      OnGetMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(const LoadingState());

    try {
      final imdbFilter = IMDBFilterModel(
        country: Country.defaultCountry(),
        releaseDate: ReleaseDate.defaultReleaseDate(),
        genre: Genres.empty(),
        runtime: Runtime.defaultRuntime(),
        userRatings: UserRatings.defaultUserRatings(),
      );
      final results = await _movieRepository.getPopularMovies(imdbFilter);

      emit(
        MoviesLoaded(
          movieModel: MovieModel(results),
        ),
      );
    } catch (e) {
      emit(
        const ErrorState('Something went wrong'),
      );
    }
  }
}
