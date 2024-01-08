part of 'tv_shows_bloc.dart';

abstract class TvShowsState extends Equatable {
  const TvShowsState();
}

class TVShowsLoaded extends TvShowsState {
  final TVShowsModel tvShowsModel;
  final bool isPaginate;

  const TVShowsLoaded({
    required this.tvShowsModel,
    this.isPaginate = false,
  });

  @override
  List<Object?> get props => [
        tvShowsModel,
        isPaginate,
      ];
}
