// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

class AvtoLikeAdvertisementTile extends Equatable {
  final int idOdAdver;
  final String urlToIconAuthor;
  final String name;
  final bool isProdano; //prodano ili kupit->

  final String lengthPhoto;
  final List<String> urlToImages;

  final bool isLiked;
  final int lengthLike;
  final int lengthComments;
  final String urlToShare;
  AvtoLikeAdvertisementTile({
    required this.idOdAdver,
    required this.urlToIconAuthor,
    required this.name,
    required this.isProdano,
    required this.lengthPhoto,
    required this.urlToImages,
    required this.isLiked,
    required this.lengthLike,
    required this.lengthComments,
    required this.urlToShare,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOdAdver,
      urlToIconAuthor,
      name,
      isProdano,
      lengthPhoto,
      urlToImages,
      isLiked,
      lengthLike,
      lengthComments,
      urlToShare,
    ];
  }

  AvtoLikeAdvertisementTile copyWith({
    int? idOdAdver,
    String? urlToIconAuthor,
    String? name,
    bool? isProdano,
    String? lengthPhoto,
    List<String>? urlToImages,
    bool? isLiked,
    int? lengthLike,
    int? lengthComments,
    String? urlToShare,
  }) {
    return AvtoLikeAdvertisementTile(
      idOdAdver: idOdAdver ?? this.idOdAdver,
      urlToIconAuthor: urlToIconAuthor ?? this.urlToIconAuthor,
      name: name ?? this.name,
      isProdano: isProdano ?? this.isProdano,
      lengthPhoto: lengthPhoto ?? this.lengthPhoto,
      urlToImages: urlToImages ?? this.urlToImages,
      isLiked: isLiked ?? this.isLiked,
      lengthLike: lengthLike ?? this.lengthLike,
      lengthComments: lengthComments ?? this.lengthComments,
      urlToShare: urlToShare ?? this.urlToShare,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOdAdver': idOdAdver,
      'urlToIconAuthor': urlToIconAuthor,
      'name': name,
      'isProdano': isProdano,
      'lengthPhoto': lengthPhoto,
      'urlToImages': urlToImages,
      'isLiked': isLiked,
      'lengthLike': lengthLike,
      'lengthComments': lengthComments,
      'urlToShare': urlToShare,
    };
  }

  factory AvtoLikeAdvertisementTile.fromMap(Map<String, dynamic> map) {
    return AvtoLikeAdvertisementTile(
      idOdAdver: map['idOdAdver'] as int,
      urlToIconAuthor: map['urlToIconAuthor'] as String,
      name: map['name'] as String,
      isProdano: map['isProdano'] as bool,
      lengthPhoto: map['lengthPhoto'] as String,
      urlToImages: List<String>.from((map['urlToImages'] as List<String>)),
      isLiked: map['isLiked'] as bool,
      lengthLike: map['lengthLike'] as int,
      lengthComments: map['lengthComments'] as int,
      urlToShare: map['urlToShare'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvtoLikeAdvertisementTile.fromJson(String source) =>
      AvtoLikeAdvertisementTile.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
