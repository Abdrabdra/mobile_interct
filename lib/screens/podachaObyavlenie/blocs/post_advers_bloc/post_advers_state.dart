part of 'post_advers_bloc.dart';

abstract class PostAdversState extends Equatable {
  const PostAdversState();
  
  @override
  List<Object> get props => [];
}

class PostAdversInitial extends PostAdversState {}

class PostAdversLoading extends PostAdversState {}

class PostAdversSuccess extends PostAdversState {}

class PostAdversFailure extends PostAdversState {}
