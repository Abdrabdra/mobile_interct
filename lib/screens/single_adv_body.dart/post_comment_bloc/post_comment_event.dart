// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_comment_bloc.dart';

abstract class PostCommentEVs extends Equatable {
  const PostCommentEVs();

  @override
  List<Object> get props => [];
}

class PostCommentEvent extends PostCommentEVs {
  const PostCommentEvent(
    this.cmi,
  );
  final CommentModelInter cmi;

  @override
  List<Object> get props => [cmi];
}

class EmitInit extends PostCommentEVs {}
