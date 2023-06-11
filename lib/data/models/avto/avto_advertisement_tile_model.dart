// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

// import '../../models/car.dart';
// import '../../models/zapchasti_single_advertisement.dart';

class AvtoAdvertisementTile extends Equatable {
  final int idOfAdver;
  final String urlMainPhoto;
  final String countImages;
  final String name;
  final String price;
  final String city1;
  final String city2;
  final String busTitle;
  final String datePublish;
  // final String probeg;
  // final String obiemDvigatel;
  // final int prosmotry;
  // final bool isThundered;
  final bool isLiked;
  // final String sostoyanie;
  // final String rule;
  // final String transmission;
  // final String phone;
  AvtoAdvertisementTile({
    required this.idOfAdver,
    required this.urlMainPhoto,
    required this.countImages,
    required this.name,
    required this.price,
    required this.city1,
    required this.city2,
    required this.busTitle,
    required this.datePublish,
    required this.isLiked,
  }) {
    // isLiked = isLiked ?? false;
    // isThundered = isThundered ?? false;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        idOfAdver,
        urlMainPhoto,
        countImages,
        name,
        datePublish,
        price,
        city1,
        city2,
        // probeg,
        busTitle,
        // obiemDvigatel,
        // prosmotry,
        // isThundered,
        isLiked,
      ];

  @override
  bool get stringify => true;
}
