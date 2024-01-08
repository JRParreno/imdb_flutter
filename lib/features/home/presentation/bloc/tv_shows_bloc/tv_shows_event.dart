part of 'tv_shows_bloc.dart';

abstract class TvShowsEvent extends Equatable {
  const TvShowsEvent();
}

class OnGetTvShowsEvent extends TvShowsEvent {
  @override
  List<Object?> get props => [];
}

class OnPaginateGetTvShowsEvent extends TvShowsEvent {
  @override
  List<Object?> get props => [];
}
