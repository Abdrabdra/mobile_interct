// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HistoryOfProsmotr extends Equatable {
  final Map<String, int> prosmotr;
  //среда: 13лайков, четверг: 21 лайков
  HistoryOfProsmotr({
    required this.prosmotr,
  });

  @override
  // TODO: implement props
  List<Object> get props => [prosmotr];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prosmotr': prosmotr,
    };
  }

  factory HistoryOfProsmotr.fromMap(Map<String, dynamic> map) {
    return HistoryOfProsmotr(
      prosmotr: Map<String, int>.from((map['prosmotr'] as Map<String, int>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryOfProsmotr.fromJson(String source) =>
      HistoryOfProsmotr.fromMap(json.decode(source) as Map<String, dynamic>);
}
