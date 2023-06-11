// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BankCardTileModel extends Equatable {
  final String typeCard; // visa ili mastercard
  final String nomerCard;
  final String month;
  final String year;
  BankCardTileModel({
    required this.typeCard,
    required this.nomerCard,
    required this.month,
    required this.year,
  });

  @override
  // TODO: implement props
  List<Object> get props => [typeCard, nomerCard, month, year];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'typeCard': typeCard,
      'nomerCard': nomerCard,
      'month': month,
      'year': year,
    };
  }

  factory BankCardTileModel.fromMap(Map<String, dynamic> map) {
    return BankCardTileModel(
      typeCard: map['typeCard'] as String,
      nomerCard: map['nomerCard'] as String,
      month: map['month'] as String,
      year: map['year'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankCardTileModel.fromJson(String source) =>
      BankCardTileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
