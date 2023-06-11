// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/chat/letter_in_chat_model.dart';

class ChatDaily extends Equatable {
  final String time;
  final List<LetterInChatModel> letters;
  ChatDaily({
    required this.time,
    required this.letters,
  });

  @override
  List<Object> get props => [time, letters];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'letters': letters.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatDaily.fromMap(Map<String, dynamic> map) {
    return ChatDaily(
      time: map['time'] as String,
      letters: List<LetterInChatModel>.from(
        (map['letters'] as List<int>).map<LetterInChatModel>(
          (x) => LetterInChatModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatDaily.fromJson(String source) =>
      ChatDaily.fromMap(json.decode(source) as Map<String, dynamic>);
}
