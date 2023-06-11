// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/profilePage/moi_advertisement_tile.dart';

class MoiAdvList extends Equatable {
  final List<MoiAdverTile> moiAdvers;
  MoiAdvList({
    required this.moiAdvers,
  });

  @override
  // TODO: implement props
  List<Object> get props => [moiAdvers];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'moiAdvers': moiAdvers.map((x) => x.toMap()).toList(),
    };
  }

  factory MoiAdvList.fromMap(Map<String, dynamic> map) {
    return MoiAdvList(
      moiAdvers: List<MoiAdverTile>.from(
        (map['moiAdvers'] as List<int>).map<MoiAdverTile>(
          (x) => MoiAdverTile.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoiAdvList.fromJson(String source) =>
      MoiAdvList.fromMap(json.decode(source) as Map<String, dynamic>);
}
