import 'dart:convert';

import 'package:equatable/equatable.dart';

class ZapchastiAdvertisementTile extends Equatable {
  final int idOfAdver;
  final String urlToMainImage;
  final String kolichestvoPhoto;
  final String name;
  final String price;
  final String gorod;
  final String type;
  final String diametr;
  final String krepej;
  final String datePublish;
  final int prosmotry;
  final bool isNew; //sostoyanie
  ZapchastiAdvertisementTile({
    required this.idOfAdver,
    required this.urlToMainImage,
    required this.kolichestvoPhoto,
    required this.name,
    required this.price,
    required this.gorod,
    required this.type,
    required this.diametr,
    required this.krepej,
    required this.datePublish,
    required this.prosmotry,
    required this.isNew,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        idOfAdver,
        urlToMainImage,
        kolichestvoPhoto,
        name,
        price,
        gorod,
        type,
        diametr,
        krepej,
        datePublish,
        prosmotry,
        isNew,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfAdver': idOfAdver,
      'urlToMainImage': urlToMainImage,
      'kolichestvoPhoto': kolichestvoPhoto,
      'name': name,
      'price': price,
      'gorod': gorod,
      'type': type,
      'diametr': diametr,
      'krepej': krepej,
      'datePublish': datePublish,
      'prosmotry': prosmotry,
      'isNew': isNew,
    };
  }

  factory ZapchastiAdvertisementTile.fromMap(Map<String, dynamic> map) {
    return ZapchastiAdvertisementTile(
      idOfAdver: map['idOfAdver'] as int,
      urlToMainImage: map['urlToMainImage'] as String,
      kolichestvoPhoto: map['kolichestvoPhoto'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      gorod: map['gorod'] as String,
      type: map['type'] as String,
      diametr: map['diametr'] as String,
      krepej: map['krepej'] as String,
      datePublish: map['datePublish'] as String,
      prosmotry: map['prosmotry'] as int,
      isNew: map['isNew'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ZapchastiAdvertisementTile.fromJson(String source) =>
      ZapchastiAdvertisementTile.fromMap(
          json.decode(source) as Map<String, dynamic>);

  ZapchastiAdvertisementTile copyWith({
    int? idOfAdver,
    String? urlToMainImage,
    String? kolichestvoPhoto,
    String? name,
    String? price,
    String? gorod,
    String? type,
    String? diametr,
    String? krepej,
    String? datePublish,
    int? prosmotry,
    bool? isNew,
  }) {
    return ZapchastiAdvertisementTile(
      idOfAdver: idOfAdver ?? this.idOfAdver,
      urlToMainImage: urlToMainImage ?? this.urlToMainImage,
      kolichestvoPhoto: kolichestvoPhoto ?? this.kolichestvoPhoto,
      name: name ?? this.name,
      price: price ?? this.price,
      gorod: gorod ?? this.gorod,
      type: type ?? this.type,
      diametr: diametr ?? this.diametr,
      krepej: krepej ?? this.krepej,
      datePublish: datePublish ?? this.datePublish,
      prosmotry: prosmotry ?? this.prosmotry,
      isNew: isNew ?? this.isNew,
    );
  }
}
