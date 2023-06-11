// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileTile extends Equatable {
  final int idOfUser;

  final String urlToImageUser;
  final String nameOfUser;
  final String phoneUser;

  final String dateUser;
  final int lengthPosts;
  final int lengthLikes;
  ProfileTile({
    required this.idOfUser,
    required this.urlToImageUser,
    required this.nameOfUser,
    required this.phoneUser,
    required this.dateUser,
    required this.lengthPosts,
    required this.lengthLikes,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOfUser,
      urlToImageUser,
      nameOfUser,
      phoneUser,
      dateUser,
      lengthPosts,
      lengthLikes,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfUser': idOfUser,
      'urlToImageUser': urlToImageUser,
      'nameOfUser': nameOfUser,
      'phoneUser': phoneUser,
      'dateUser': dateUser,
      'lengthPosts': lengthPosts,
      'lengthLikes': lengthLikes,
    };
  }

  factory ProfileTile.fromMap(Map<String, dynamic> map) {
    return ProfileTile(
      idOfUser: map['idOfUser'] as int,
      urlToImageUser: map['urlToImageUser'] as String,
      nameOfUser: map['nameOfUser'] as String,
      phoneUser: map['phoneUser'] as String,
      dateUser: map['dateUser'] as String,
      lengthPosts: map['lengthPosts'] as int,
      lengthLikes: map['lengthLikes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileTile.fromJson(String source) =>
      ProfileTile.fromMap(json.decode(source) as Map<String, dynamic>);

  ProfileTile copyWith({
    int? idOfUser,
    String? urlToImageUser,
    String? nameOfUser,
    String? phoneUser,
    String? dateUser,
    int? lengthPosts,
    int? lengthLikes,
  }) {
    return ProfileTile(
      idOfUser: idOfUser ?? this.idOfUser,
      urlToImageUser: urlToImageUser ?? this.urlToImageUser,
      nameOfUser: nameOfUser ?? this.nameOfUser,
      phoneUser: phoneUser ?? this.phoneUser,
      dateUser: dateUser ?? this.dateUser,
      lengthPosts: lengthPosts ?? this.lengthPosts,
      lengthLikes: lengthLikes ?? this.lengthLikes,
    );
  }
}
