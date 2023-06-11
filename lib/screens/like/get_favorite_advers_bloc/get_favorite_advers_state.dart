part of 'get_favorite_advers_bloc.dart';

abstract class GetFavoriteAdversState extends Equatable {
  const GetFavoriteAdversState();

  @override
  List<Object> get props => [];
}

class GetFavAdvertisementsInitial extends GetFavoriteAdversState {}

class GetAdvertisementsLoading extends GetFavoriteAdversState {}

class GetAdvertisementsSuccess extends GetFavoriteAdversState {
  final List<AvtoAdvertisementTile> list;
  GetAdvertisementsSuccess({
    required this.list,
  });

  @override
  List<Object> get props => [list];
}

class GetAdvertisementsFailure extends GetFavoriteAdversState {}
