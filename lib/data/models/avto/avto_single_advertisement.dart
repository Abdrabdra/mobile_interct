// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'avto_advertisement_tile_model.dart';
import 'comment_body_tile.dart';

// ignore: must_be_immutable
class SingleAvtoAdvertisement extends Equatable {
  final int idOfAdver;
  final String urlToShare;
  final List<String> urlToImages;

  bool isLiked;
  bool isTop10;
  bool isInRecomendation;
  final String name;
  final String price;
  final int numberLikes;

  // dal'we detali
  final String gorod;
  final String pokolenie;
  final String kuzov;
  final String obiemDvigatel;
  final String probegKm;
  final String korobka;
  final String privod;
  final String rule;
  final String color;
  final bool isRastomojen;
  final String sostoyanie;

  // comments
  final int lengthOfComments;
  final List<CommentBodyTile> comments;

  final String description;

  final List<String> optsiiCharacteristics;
  final List<AvtoAdvertisementTile> pohojieAvtoAdvers; //pohozhie

  final String phoneToCall;
  SingleAvtoAdvertisement({
    required this.idOfAdver,
    required this.urlToShare,
    required this.urlToImages,
    required this.isLiked,
    required this.isTop10,
    required this.isInRecomendation,
    required this.name,
    required this.price,
    required this.numberLikes,
    required this.gorod,
    required this.pokolenie,
    required this.kuzov,
    required this.obiemDvigatel,
    required this.probegKm,
    required this.korobka,
    required this.privod,
    required this.rule,
    required this.color,
    required this.isRastomojen,
    required this.sostoyanie,
    required this.lengthOfComments,
    required this.comments,
    required this.description,
    required this.optsiiCharacteristics,
    required this.pohojieAvtoAdvers,
    required this.phoneToCall,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOfAdver,
      urlToShare,
      urlToImages,
      isLiked,
      isTop10,
      isInRecomendation,
      name,
      price,
      numberLikes,
      gorod,
      pokolenie,
      kuzov,
      obiemDvigatel,
      probegKm,
      korobka,
      privod,
      rule,
      color,
      isRastomojen,
      sostoyanie,
      lengthOfComments,
      comments,
      description,
      optsiiCharacteristics,
      pohojieAvtoAdvers,
      phoneToCall,
    ];
  }
}
