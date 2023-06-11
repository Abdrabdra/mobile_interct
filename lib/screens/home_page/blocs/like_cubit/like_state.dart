part of 'like_cubit.dart';

abstract class LikeState extends Equatable {
  const LikeState();

  @override
  List<Object> get props => [];
}

class LikeInitial extends LikeState {}

class LikeSuccess extends LikeState {}

class LikeFailure extends LikeState {}
