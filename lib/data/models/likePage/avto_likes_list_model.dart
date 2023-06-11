// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/likePage/avto_like_advertisement_tile.dart';

class ListAvtoLikes extends Equatable {
  final int? lengthAdver;
  final List<AvtoLikeAdvertisementTile> listAvtoLikeAdvTiles;
  ListAvtoLikes({
    this.lengthAdver,
    required this.listAvtoLikeAdvTiles,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        lengthAdver!,
        listAvtoLikeAdvTiles,
      ];

  ListAvtoLikes copyWith({
    int? lengthAdver,
    List<AvtoLikeAdvertisementTile>? listAvtoLikeAdvTiles,
  }) {
    return ListAvtoLikes(
      lengthAdver: lengthAdver ?? this.lengthAdver,
      listAvtoLikeAdvTiles: listAvtoLikeAdvTiles ?? this.listAvtoLikeAdvTiles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lengthAdver': lengthAdver,
      'listAvtoLikeAdvTiles':
          listAvtoLikeAdvTiles.map((x) => x.toMap()).toList(),
    };
  }

  factory ListAvtoLikes.fromMap(Map<String, dynamic> map) {
    return ListAvtoLikes(
      lengthAdver: map['lengthAdver'] as int,
      listAvtoLikeAdvTiles: List<AvtoLikeAdvertisementTile>.from(
        (map['listAvtoLikeAdvTiles'] as List<int>)
            .map<AvtoLikeAdvertisementTile>(
          (x) => AvtoLikeAdvertisementTile.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListAvtoLikes.fromJson(String source) =>
      ListAvtoLikes.fromMap(json.decode(source) as Map<String, dynamic>);
}
