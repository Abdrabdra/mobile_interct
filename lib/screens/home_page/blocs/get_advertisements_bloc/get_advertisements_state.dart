// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_advertisements_bloc.dart';

abstract class GetAdvertisementsState extends Equatable {
  const GetAdvertisementsState();

  @override
  List<Object> get props => [];
}

class GetAdvertisementsInitial extends GetAdvertisementsState {}

class GetAdvertisementsLoading extends GetAdvertisementsState {}

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

class GetAdvertisementsSuccess extends GetAdvertisementsState {
  final List<AvtoAdvertisementTile> list;
  final bool isReachedMax;
  GetAdvertisementsSuccess({
    required this.isReachedMax,
    required this.list,
  });

  @override
  List<Object> get props => [list, isReachedMax];

  GetAdvertisementsSuccess copyWith({
    List<AvtoAdvertisementTile>? list,
    bool? isReachedMax,
  }) {
    return GetAdvertisementsSuccess(
      list: list ?? this.list,
      isReachedMax: isReachedMax ?? this.isReachedMax,
    );
  }
}

class GetAdvertisementsFailure extends GetAdvertisementsState {}
