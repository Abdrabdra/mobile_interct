// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LetterInChatModel extends Equatable {
  final String text;
  final String time;
  final bool isAuthorsLetter;
  LetterInChatModel({
    required this.text,
    required this.time,
    required this.isAuthorsLetter,
  });

  @override
  List<Object> get props => [text, time, isAuthorsLetter];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'time': time,
      'isAuthorsLetter': isAuthorsLetter,
    };
  }

  factory LetterInChatModel.fromMap(Map<String, dynamic> map) {
    return LetterInChatModel(
      text: map['text'] as String,
      time: map['time'] as String,
      isAuthorsLetter: map['isAuthorsLetter'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LetterInChatModel.fromJson(String source) =>
      LetterInChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  LetterInChatModel copyWith({
    String? text,
    String? time,
    bool? isAuthorsLetter,
  }) {
    return LetterInChatModel(
      text: text ?? this.text,
      time: time ?? this.time,
      isAuthorsLetter: isAuthorsLetter ?? this.isAuthorsLetter,
    );
  }
}
