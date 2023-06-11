// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeCarousel extends Equatable {
  final List<HomeCarouselTile> images;
  HomeCarousel({
    required this.images,
  });

  @override
  // TODO: implement props
  List<Object> get props => [images];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'images': images.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeCarousel.fromMap(Map<String, dynamic> map) {
    return HomeCarousel(
      images: List<HomeCarouselTile>.from(
        (map['images'] as List<int>).map<HomeCarouselTile>(
          (x) => HomeCarouselTile.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeCarousel.fromJson(String source) =>
      HomeCarousel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class HomeCarouselTile extends Equatable {
  final String urlToImages;
  final String? urlfromImages;
  HomeCarouselTile({
    required this.urlToImages,
    this.urlfromImages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'urlToImages': urlToImages,
      'urlfromImages': urlfromImages,
    };
  }

  factory HomeCarouselTile.fromMap(Map<String, dynamic> map) {
    return HomeCarouselTile(
      urlToImages: map['urlToImages'] as String,
      urlfromImages:
          map['urlfromImages'] != null ? map['urlfromImages'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeCarouselTile.fromJson(String source) =>
      HomeCarouselTile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  // TODO: implement props
  List<Object> get props => [
        urlToImages,
        urlfromImages!,
      ];
}
