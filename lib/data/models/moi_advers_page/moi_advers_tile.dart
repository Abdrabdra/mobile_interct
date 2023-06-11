// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../../data/models/avto/avto_advertisement_tile_model.dart';

class MoiAdversTile extends Equatable {
  final String type; // activnye na_proverke archivnye
  final List<AvtoAdvertisementTile> avtoAdvers;
  MoiAdversTile({
    required this.type,
    required this.avtoAdvers,
  });

  @override
  // TODO: implement props
  List<Object> get props => [type, avtoAdvers];
}
