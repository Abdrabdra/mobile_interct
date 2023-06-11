// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_user_me_bloc.dart';

abstract class GetUserMeState extends Equatable {
  const GetUserMeState();
  
  @override
  List<Object> get props => [];
}

class GetUserMeInitial extends GetUserMeState {}

class GetUserMeLoading extends GetUserMeState {}

class GetUserMeSuccess extends GetUserMeState {
  final UserMeModel umm;
  GetUserMeSuccess({
    required this.umm,
  });

  @override
  List<Object> get props => [umm];
}

class GetUserMeFailure extends GetUserMeState {}
