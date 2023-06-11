// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/chat/chat_tile_in_list.dart';

class ListOfChat extends Equatable {
  final List<ChatTileInList> chats;
  ListOfChat({
    required this.chats,
  });

  @override
  // TODO: implement props
  List<Object> get props => [chats];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chats': chats.map((x) => x.toMap()).toList(),
    };
  }

  factory ListOfChat.fromMap(Map<String, dynamic> map) {
    return ListOfChat(
      chats: List<ChatTileInList>.from(
        (map['chats'] as List<int>).map<ChatTileInList>(
          (x) => ChatTileInList.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListOfChat.fromJson(String source) =>
      ListOfChat.fromMap(json.decode(source) as Map<String, dynamic>);
}
