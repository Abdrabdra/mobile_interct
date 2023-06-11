// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class IzmenenieParaol extends Equatable {
  final int idOfUser;
  final String oldParol;
  final String newParol;
  IzmenenieParaol({
    required this.idOfUser,
    required this.oldParol,
    required this.newParol,
  });

  @override
  // TODO: implement props
  List<Object> get props => [idOfUser, oldParol, newParol];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfUser': idOfUser,
      'oldParol': oldParol,
      'newParol': newParol,
    };
  }

  factory IzmenenieParaol.fromMap(Map<String, dynamic> map) {
    return IzmenenieParaol(
      idOfUser: map['idOfUser'] as int,
      oldParol: map['oldParol'] as String,
      newParol: map['newParol'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IzmenenieParaol.fromJson(String source) =>
      IzmenenieParaol.fromMap(json.decode(source) as Map<String, dynamic>);
}
