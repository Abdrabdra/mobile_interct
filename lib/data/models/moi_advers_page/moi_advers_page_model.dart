// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/profilePage/moi_advertisement_tile.dart';

class MoiAdversPage extends Equatable {
  final List<MoiAdverTile> moiAdvers;
  MoiAdversPage({
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

  factory MoiAdversPage.fromMap(Map<String, dynamic> map) {
    return MoiAdversPage(
      moiAdvers: List<MoiAdverTile>.from(
        (map['moiAdvers'] as List<int>).map<MoiAdverTile>(
          (x) => MoiAdverTile.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoiAdversPage.fromJson(String source) =>
      MoiAdversPage.fromMap(json.decode(source) as Map<String, dynamic>);
}
