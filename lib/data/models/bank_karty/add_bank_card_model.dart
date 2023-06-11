// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddBankCardModel extends Equatable {
  final int idOfUser;

  final String nomerCard;

  final String nameFnameOnCard;

  final String month;
  final String year;

  final String cvc;
  AddBankCardModel({
    required this.idOfUser,
    required this.nomerCard,
    required this.nameFnameOnCard,
    required this.month,
    required this.year,
    required this.cvc,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOfUser,
      nomerCard,
      nameFnameOnCard,
      month,
      year,
      cvc,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfUser': idOfUser,
      'nomerCard': nomerCard,
      'nameFnameOnCard': nameFnameOnCard,
      'month': month,
      'year': year,
      'cvc': cvc,
    };
  }

  factory AddBankCardModel.fromMap(Map<String, dynamic> map) {
    return AddBankCardModel(
      idOfUser: map['idOfUser'] as int,
      nomerCard: map['nomerCard'] as String,
      nameFnameOnCard: map['nameFnameOnCard'] as String,
      month: map['month'] as String,
      year: map['year'] as String,
      cvc: map['cvc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddBankCardModel.fromJson(String source) =>
      AddBankCardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
