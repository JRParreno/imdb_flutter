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

part 'home_movies_event.dart';
part 'home_movies_state.dart';

class HomeMoviesBloc extends Bloc<HomeMoviesEvent, HomeMoviesState> {
  final MovieRepository _movieRepository;

  HomeMoviesBloc(this._movieRepository) : super(const InitialState()) {
    on<OnGetHomeMoviesEvent>(onGetHomeMoviesEvent);
  }

  Future<void> onGetHomeMoviesEvent(
      OnGetHomeMoviesEvent event, Emitter<HomeMoviesState> emit) async {
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
        HomeMoviesLoaded(
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
