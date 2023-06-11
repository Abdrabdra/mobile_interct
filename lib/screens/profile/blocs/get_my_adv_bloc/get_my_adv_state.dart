part of 'get_my_adv_bloc.dart';

abstract class GetAdvertisementsState extends Equatable {
  const GetAdvertisementsState();

  @override
  List<Object> get props => [];
}

class GetMyAdvertisementsInitial extends GetAdvertisementsState {}

class GetMyAdvertisementsLoading extends GetAdvertisementsState {}

// class GetNextAdvertisementsLoading extends GetAdvertisementsState {
//   final List<AvtoAdvertisementTile> list;
//   final bool isReachedMax;
//   GetNextAdvertisementsLoading({
//     required this.isReachedMax,
//     required this.list,
//   });

//   @override
//   List<Object> get props => [list, isReachedMax];
// }

class GetMyAdvertisementsSuccess extends GetAdvertisementsState {
  final List<AvtoAdvertisementTile> list;
  final bool isReachedMax;
  GetMyAdvertisementsSuccess({
    required this.isReachedMax,
    required this.list,
  });

  @override
  List<Object> get props => [list, isReachedMax];

  GetMyAdvertisementsSuccess copyWith({
    List<AvtoAdvertisementTile>? list,
    bool? isReachedMax,
  }) {
    return GetMyAdvertisementsSuccess(
      list: list ?? this.list,
      isReachedMax: isReachedMax ?? this.isReachedMax,
    );
  }
}

class GetMyAdvertisementsFailure extends GetAdvertisementsState {}
