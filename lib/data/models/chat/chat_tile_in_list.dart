// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ChatTileInList extends Equatable {
  int idOfChat;
  final String urlToImageClient;
  final String nameOfAdver;
  final String nameClient;
  final bool isClientOnline;
  final String text;
  final bool isReaded;

  final String time;
  ChatTileInList({
    required this.idOfChat,
    required this.urlToImageClient,
    required this.nameOfAdver,
    required this.nameClient,
    required this.isClientOnline,
    required this.text,
    required this.isReaded,
    required this.time,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOfChat,
      urlToImageClient,
      nameOfAdver,
      nameClient,
      isClientOnline,
      text,
      isReaded,
      time,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfChat': idOfChat,
      'urlToImageClient': urlToImageClient,
      'nameOfAdver': nameOfAdver,
      'nameClient': nameClient,
      'isClientOnline': isClientOnline,
      'text': text,
      'isReaded': isReaded,
      'time': time,
    };
  }

  factory ChatTileInList.fromMap(Map<String, dynamic> map) {
    return ChatTileInList(
      idOfChat: map['idOfChat'] as int,
      urlToImageClient: map['urlToImageClient'] as String,
      nameOfAdver: map['nameOfAdver'] as String,
      nameClient: map['nameClient'] as String,
      isClientOnline: map['isClientOnline'] as bool,
      text: map['text'] as String,
      isReaded: map['isReaded'] as bool,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatTileInList.fromJson(String source) =>
      ChatTileInList.fromMap(json.decode(source) as Map<String, dynamic>);
}
