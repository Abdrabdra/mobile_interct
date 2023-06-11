// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_single_adv_bloc.dart';

abstract class GetSingleAdvEvent extends Equatable {
  const GetSingleAdvEvent();

  @override
  List<Object> get props => [];
}

class GetInfo extends GetSingleAdvEvent {
  const GetInfo(
    this.id,
  );
  final int id;
  @override
  List<Object> get props => [id];
}
