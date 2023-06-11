// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BankKarta extends Equatable {
  int id;
  String type; // visa ili mastercard
  String numberKarta; // 4400 5500 00044 7788
  String name_surname;
  int month;
  int year;
  int cvc;
  BankKarta({
    required this.id,
    required this.type,
    required this.numberKarta,
    required this.name_surname,
    required this.month,
    required this.year,
    required this.cvc,
  }) {
    // assert(id != null, "A bankKarta ID is required.");
    // assert(name_surname != null, "A name and surname is required.");
    // assert(type != null, "A type is required.");
    // assert(numberKarta != null, "A numberKarta is required.");
    // assert(month != null, "A month is required.");
    // assert(year != null, "A year is required.");
    // assert(cvc != null, "A cvc is required.");
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'numberKarta': numberKarta,
      'name_surname': name_surname,
      'month': month,
      'year': year,
      'cvc': cvc,
    };
  }

  factory BankKarta.fromMap(Map<String, dynamic> map) {
    return BankKarta(
      id: map['id'] as int,
      type: map['type'] as String,
      numberKarta: map['numberKarta'] as String,
      name_surname: map['name_surname'] as String,
      month: map['month'] as int,
      year: map['year'] as int,
      cvc: map['cvc'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankKarta.fromJson(String source) =>
      BankKarta.fromMap(json.decode(source) as Map<String, dynamic>);

  BankKarta copyWith({
    int? id,
    String? type,
    String? numberKarta,
    String? name_surname,
    int? month,
    int? year,
    int? cvc,
  }) {
    return BankKarta(
      id: id ?? this.id,
      type: type ?? this.type,
      numberKarta: numberKarta ?? this.numberKarta,
      name_surname: name_surname ?? this.name_surname,
      month: month ?? this.month,
      year: year ?? this.year,
      cvc: cvc ?? this.cvc,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        type,
        numberKarta,
        name_surname,
        month,
        year,
        cvc,
      ];
}
