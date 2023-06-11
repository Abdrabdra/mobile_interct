// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class CommentBodyTile extends Equatable {
  final int idOfComment;
  final int idOfUser;

  final bool isOtvet;
  final String? nameAuthorAnswersComment;

  final String nameOfUser;
  final String text;
  CommentBodyTile({
    required this.idOfComment,
    required this.idOfUser,
    required this.isOtvet,
    this.nameAuthorAnswersComment,
    required this.nameOfUser,
    required this.text,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOfComment,
      idOfUser,
      isOtvet,
      nameAuthorAnswersComment!,
      nameOfUser,
      text,
    ];
  }
}
