// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'zapchasti_advertisement_tile.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// import 'avto/avto_advertisement_tile_model.dart';

class ZapchastiAdvertisementList extends Equatable {
  final int lengthAdvs;
  final List<ZapchastiAdvertisementTile> zapchastiAdvList;
  ZapchastiAdvertisementList({
    required this.lengthAdvs,
    required this.zapchastiAdvList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lengthAdvs': lengthAdvs,
      'avtoAdvList': zapchastiAdvList.map((x) => x.toMap()).toList(),
    };
  }

  factory ZapchastiAdvertisementList.fromMap(Map<String, dynamic> map) {
    return ZapchastiAdvertisementList(
      lengthAdvs: map['lengthAdvs'] as int,
      zapchastiAdvList: List<ZapchastiAdvertisementTile>.from(
        (map['avtoAdvList'] as List<int>).map<ZapchastiAdvertisementTile>(
          (x) => ZapchastiAdvertisementTile.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ZapchastiAdvertisementList.fromJson(String source) =>
      ZapchastiAdvertisementList.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  // TODO: implement props
  List<Object> get props => [lengthAdvs, zapchastiAdvList];

  ZapchastiAdvertisementList copyWith({
    int? lengthAdvs,
    List<ZapchastiAdvertisementTile>? avtoAdvList,
  }) {
    return ZapchastiAdvertisementList(
      lengthAdvs: lengthAdvs ?? this.lengthAdvs,
      zapchastiAdvList: avtoAdvList ?? this.zapchastiAdvList,
    );
  }
}
