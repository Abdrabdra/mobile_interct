// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/models/statistics_page/history_of_likes.dart';
import '../../../data/models/statistics_page/history_of_prosmotrov.dart';

class StatisticsModel extends Equatable {
  final HistoryOfProsmotr historyOfProsmotr;
  final HistoryOfLikes historyOfLikes;
  StatisticsModel({
    required this.historyOfProsmotr,
    required this.historyOfLikes,
  });

  @override
  // TODO: implement props
  List<Object> get props => [historyOfProsmotr, historyOfLikes];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'historyOfProsmotr': historyOfProsmotr.toMap(),
      'historyOfLikes': historyOfLikes.toMap(),
    };
  }

  factory StatisticsModel.fromMap(Map<String, dynamic> map) {
    return StatisticsModel(
      historyOfProsmotr: HistoryOfProsmotr.fromMap(
          map['historyOfProsmotr'] as Map<String, dynamic>),
      historyOfLikes:
          HistoryOfLikes.fromMap(map['historyOfLikes'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatisticsModel.fromJson(String source) =>
      StatisticsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
