part of 'fan_favorite_bloc.dart';

abstract class FanFavoriteState extends Equatable {
  const FanFavoriteState();
}

class FanFavoritesLoaded extends FanFavoriteState {
  final FanFavoriteModel fanFavoriteModel;
  final bool isPaginate;

  const FanFavoritesLoaded({
    required this.fanFavoriteModel,
    this.isPaginate = false,
  });

  @override
  List<Object?> get props => [
        fanFavoriteModel,
        isPaginate,
      ];
}
