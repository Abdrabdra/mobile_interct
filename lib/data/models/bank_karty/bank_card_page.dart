// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../data/models/bank_karty/bank_card_tile_model.dart';

class BankCardPageModel extends Equatable {
  final List<BankCardTileModel> bankCards;
  BankCardPageModel({
    required this.bankCards,
  });

  @override
  // TODO: implement props
  List<Object> get props => [bankCards];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bankCards': bankCards.map((x) => x.toMap()).toList(),
    };
  }

  factory BankCardPageModel.fromMap(Map<String, dynamic> map) {
    return BankCardPageModel(
      bankCards: List<BankCardTileModel>.from(
        (map['bankCards'] as List<int>).map<BankCardTileModel>(
          (x) => BankCardTileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BankCardPageModel.fromJson(String source) =>
      BankCardPageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
