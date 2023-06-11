// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/profilePage/moi_advertisement_list.dart';
import '../../../data/models/profilePage/profile_tile.dart';

class ProfilePageModel extends Equatable {
  final int idOfUser;

  final ProfileTile profileTile;
  final MoiAdvList moiAdvList;
  ProfilePageModel({
    required this.idOfUser,
    required this.profileTile,
    required this.moiAdvList,
  });

  @override
  // TODO: implement props
  List<Object> get props => [idOfUser, profileTile, moiAdvList];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfUser': idOfUser,
      'profileTile': profileTile.toMap(),
      'moiAdvList': moiAdvList.toMap(),
    };
  }

  factory ProfilePageModel.fromMap(Map<String, dynamic> map) {
    return ProfilePageModel(
      idOfUser: map['idOfUser'] as int,
      profileTile:
          ProfileTile.fromMap(map['profileTile'] as Map<String, dynamic>),
      moiAdvList: MoiAdvList.fromMap(map['moiAdvList'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfilePageModel.fromJson(String source) =>
      ProfilePageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
