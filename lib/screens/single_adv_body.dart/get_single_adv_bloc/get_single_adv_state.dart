// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_single_adv_bloc.dart';

abstract class GetSingleAdvState extends Equatable {
  const GetSingleAdvState();

  @override
  List<Object> get props => [];
}

class GetSingleAdvInitial extends GetSingleAdvState {}

class GetSingleAdvLoading extends GetSingleAdvState {}

class GetSingleAdvSuccess extends GetSingleAdvState {
  final SingleAvtoAdvModel saam;
  GetSingleAdvSuccess({
    required this.saam,
  });

  @override
  List<Object> get props => [saam];
}

class GetSingleAdvFailure extends GetSingleAdvState {}
