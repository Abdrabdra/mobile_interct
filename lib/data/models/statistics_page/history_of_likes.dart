// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HistoryOfLikes extends Equatable {
  final Map<String, int> likes; //среда: 13лайков, четверг: 21 лайков
  HistoryOfLikes({
    required this.likes,
  });

  @override
  List<Object> get props => [likes];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'likes': likes,
    };
  }

  factory HistoryOfLikes.fromMap(Map<String, dynamic> map) {
    return HistoryOfLikes(
      likes: Map<String, int>.from((map['likes'] as Map<String, int>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryOfLikes.fromJson(String source) =>
      HistoryOfLikes.fromMap(json.decode(source) as Map<String, dynamic>);
}
