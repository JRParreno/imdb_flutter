part of 'fan_favorite_bloc.dart';

abstract class FanFavoritesEvent extends Equatable {
  const FanFavoritesEvent();
}

class OnGetFanFavoritesEvent extends FanFavoritesEvent {
  @override
  List<Object?> get props => [];
}

class OnPaginateGetFanFavoritesEvent extends FanFavoritesEvent {
  @override
  List<Object?> get props => [];
}
