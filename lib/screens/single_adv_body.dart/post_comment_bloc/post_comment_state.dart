part of 'post_comment_bloc.dart';

abstract class PostCommentState extends Equatable {
  const PostCommentState();

  @override
  List<Object> get props => [];
}

class PostCommentInitial extends PostCommentState {}

class PostCommentLoading extends PostCommentState {}

class PostCommentSuccess extends PostCommentState {}

class PostCommentFailure extends PostCommentState {}
