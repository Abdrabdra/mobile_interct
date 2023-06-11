// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../../data/models/avto/avto_advertisement_tile_model.dart';
import '../../../data/models/homePage/home_carousel_model.dart';

class HomePageModel extends Equatable {
  final HomeCarousel homeCarousel;
  final List<AvtoAdvertisementTile> avtoAdverList;
  HomePageModel({
    required this.homeCarousel,
    required this.avtoAdverList,
  });

  @override
  // TODO: implement props
  List<Object> get props => [homeCarousel, avtoAdverList];
}
