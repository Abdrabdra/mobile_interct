// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_advertisements_bloc.dart';

abstract class GetAdvertisementsEvent extends Equatable {
  const GetAdvertisementsEvent();

  @override
  List<Object> get props => [];
}

class GetAvtoAdvertisementsEvent extends GetAdvertisementsEvent {
  const GetAvtoAdvertisementsEvent(
    this.arm,
  );
  final AvtoRequestModel arm;

  @override
  List<Object> get props => [arm];
}

class GetNextAvtoAdvertisementsEvent extends GetAdvertisementsEvent {
  const GetNextAvtoAdvertisementsEvent(
    this.arm,
  );
  final AvtoRequestModel arm;

  @override
  List<Object> get props => [arm];
}
