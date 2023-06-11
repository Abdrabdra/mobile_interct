// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LichnyeDannyePage extends Equatable {
  final int idUser; // nuzhno pri otpavki izmenennih dannyh

  final String urlToImageUser;

  final String nameUser;
  final String phoneUser;

  bool isPodtverjden;

  final int dateOfBirth;
  final int monthOfBirth;
  final int yearOfBirh;
  LichnyeDannyePage({
    required this.idUser,
    required this.urlToImageUser,
    required this.nameUser,
    required this.phoneUser,
    required this.isPodtverjden,
    required this.dateOfBirth,
    required this.monthOfBirth,
    required this.yearOfBirh,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idUser,
      urlToImageUser,
      nameUser,
      phoneUser,
      isPodtverjden,
      dateOfBirth,
      monthOfBirth,
      yearOfBirh,
    ];
  }

  LichnyeDannyePage copyWith({
    int? idUser,
    String? urlToImageUser,
    String? nameUser,
    String? phoneUser,
    bool? isPodtverjden,
    int? dateOfBirth,
    int? monthOfBirth,
    int? yearOfBirh,
  }) {
    return LichnyeDannyePage(
      idUser: idUser ?? this.idUser,
      urlToImageUser: urlToImageUser ?? this.urlToImageUser,
      nameUser: nameUser ?? this.nameUser,
      phoneUser: phoneUser ?? this.phoneUser,
      isPodtverjden: isPodtverjden ?? this.isPodtverjden,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      monthOfBirth: monthOfBirth ?? this.monthOfBirth,
      yearOfBirh: yearOfBirh ?? this.yearOfBirh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'urlToImageUser': urlToImageUser,
      'nameUser': nameUser,
      'phoneUser': phoneUser,
      'isPodtverjden': isPodtverjden,
      'dateOfBirth': dateOfBirth,
      'monthOfBirth': monthOfBirth,
      'yearOfBirh': yearOfBirh,
    };
  }

  factory LichnyeDannyePage.fromMap(Map<String, dynamic> map) {
    return LichnyeDannyePage(
      idUser: map['idUser'] as int,
      urlToImageUser: map['urlToImageUser'] as String,
      nameUser: map['nameUser'] as String,
      phoneUser: map['phoneUser'] as String,
      isPodtverjden: map['isPodtverjden'] as bool,
      dateOfBirth: map['dateOfBirth'] as int,
      monthOfBirth: map['monthOfBirth'] as int,
      yearOfBirh: map['yearOfBirh'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LichnyeDannyePage.fromJson(String source) =>
      LichnyeDannyePage.fromMap(json.decode(source) as Map<String, dynamic>);
}
