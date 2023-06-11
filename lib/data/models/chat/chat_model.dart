// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/chat/chat_dayli_model.dart';

class ChatModel extends Equatable {
  final int idOfChat;
  final String urlToImageClient;
  final String nameOfClient;
  final List<ChatDaily> dailyChats;
  ChatModel({
    required this.idOfChat,
    required this.urlToImageClient,
    required this.nameOfClient,
    required this.dailyChats,
  });

  @override
  // TODO: implement props
  List<Object> get props =>
      [idOfChat, urlToImageClient, nameOfClient, dailyChats];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfChat': idOfChat,
      'urlToImageClient': urlToImageClient,
      'nameOfClient': nameOfClient,
      'dailyChats': dailyChats.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      idOfChat: map['idOfChat'] as int,
      urlToImageClient: map['urlToImageClient'] as String,
      nameOfClient: map['nameOfClient'] as String,
      dailyChats: List<ChatDaily>.from(
        (map['dailyChats'] as List<int>).map<ChatDaily>(
          (x) => ChatDaily.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
