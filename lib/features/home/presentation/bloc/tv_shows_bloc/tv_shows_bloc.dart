import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/bloc/common/common_state.dart';
import 'package:flutter_imdb/features/movies/data/models/country.dart';
import 'package:flutter_imdb/features/movies/data/models/genres.dart';
import 'package:flutter_imdb/features/movies/data/models/imdb_filter_model.dart';
import 'package:flutter_imdb/features/movies/data/models/release_date.dart';
import 'package:flutter_imdb/features/movies/data/models/run_time.dart';
import 'package:flutter_imdb/features/movies/data/models/user_ratings.dart';
import 'package:flutter_imdb/features/tv_shows/data/models/tv_shows_model.dart';
import 'package:flutter_imdb/features/tv_shows/domain/repositories/tv_show_repository.dart';

part 'tv_shows_event.dart';
part 'tv_shows_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final TVShowRepository _tvShowRepository;

  TvShowsBloc(this._tvShowRepository) : super(const InitialState()) {
    on<OnGetTvShowsEvent>(_onGetTvShowsEvent);
  }

  Future<void> _onGetTvShowsEvent(
      OnGetTvShowsEvent event, Emitter<TvShowsState> emit) async {
    emit(const LoadingState());

    try {
      final imdbFilter = IMDBFilterModel(
        country: Country.defaultCountry(),
        releaseDate: ReleaseDate.defaultReleaseDate(),
        genre: Genres.empty(),
        runtime: Runtime.defaultRuntime(),
        userRatings: UserRatings.defaultUserRatings(),
      );
      final results = await _tvShowRepository.getPopularTVShows(imdbFilter);

      emit(
        TVShowsLoaded(
          tvShowsModel: TVShowsModel(results),
        ),
      );
    } catch (e) {
      emit(
        const ErrorState('Something went wrong'),
      );
    }
  }
}
