part of 'get_my_adv_bloc.dart';

abstract class GetMyAdvEvent extends Equatable {
  const GetMyAdvEvent();

  @override
  List<Object> get props => [];
}

class GetMyAvtoAdvertisementsEvent extends GetMyAdvEvent {
  const GetMyAvtoAdvertisementsEvent(
    this.arm,
  );
  final AvtoRequestModel arm;

  @override
  List<Object> get props => [arm];
}
