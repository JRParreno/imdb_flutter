import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_imdb/core/bloc/common/common_state.dart';
import 'package:flutter_imdb/features/fan_favorites/data/models/fan_favorite_model.dart';
import 'package:flutter_imdb/features/fan_favorites/domain/repositories/fan_favorite_repository.dart';

part 'fan_favorite_event.dart';
part 'fan_favorite_state.dart';

class FanFavoriteBloc extends Bloc<FanFavoritesEvent, FanFavoriteState> {
  final FanFavoriteRepository _fanFavoriteRepository;

  FanFavoriteBloc(this._fanFavoriteRepository) : super(const InitialState()) {
    on<OnGetFanFavoritesEvent>(onGetFanFavoritesEvent);
  }

  Future<void> onGetFanFavoritesEvent(
      OnGetFanFavoritesEvent event, Emitter<FanFavoriteState> emit) async {
    emit(const LoadingState());

    try {
      final results = await _fanFavoriteRepository.getFanFavorites('PH');

      emit(
        FanFavoritesLoaded(
          fanFavoriteModel: FanFavoriteModel(results),
        ),
      );
    } catch (e) {
      emit(
        const ErrorState('Something went wrong'),
      );
    }
  }
}
