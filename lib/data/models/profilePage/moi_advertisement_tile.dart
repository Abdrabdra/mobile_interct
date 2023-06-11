// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MoiAdverTile extends Equatable {
  final int idOfAdv;

  final String urlToImageAdv;
  final String nameAdv;
  final int lengthProsmotrov;
  final int lengthLikes;
  MoiAdverTile({
    required this.idOfAdv,
    required this.urlToImageAdv,
    required this.nameAdv,
    required this.lengthProsmotrov,
    required this.lengthLikes,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOfAdv,
      urlToImageAdv,
      nameAdv,
      lengthProsmotrov,
      lengthLikes,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfAdv': idOfAdv,
      'urlToImageAdv': urlToImageAdv,
      'nameAdv': nameAdv,
      'lengthProsmotrov': lengthProsmotrov,
      'lengthLikes': lengthLikes,
    };
  }

  factory MoiAdverTile.fromMap(Map<String, dynamic> map) {
    return MoiAdverTile(
      idOfAdv: map['idOfAdv'] as int,
      urlToImageAdv: map['urlToImageAdv'] as String,
      nameAdv: map['nameAdv'] as String,
      lengthProsmotrov: map['lengthProsmotrov'] as int,
      lengthLikes: map['lengthLikes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoiAdverTile.fromJson(String source) =>
      MoiAdverTile.fromMap(json.decode(source) as Map<String, dynamic>);
}
