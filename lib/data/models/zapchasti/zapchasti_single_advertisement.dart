// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// import '../../models/avto_advertisement_tile_model.dart';
// / import '../../models/car.dart';
// import '../../models/zapchasti_advertisement_tile.dart';

class SingleZapchastiAdvertisement extends Equatable {
  final int idOfAdver;
  final String urlToShare;
  final String name;
  final String price;

  // dal'we detali
  final String gorod;
  final bool isNew; //sostoyanie
  final String type;
  final String diametr;
  final String krepej;

  final String description;

  final String dateOfPublish;
  final int prosmotry;

  final String phoneToCall;
  SingleZapchastiAdvertisement({
    required this.idOfAdver,
    required this.urlToShare,
    required this.name,
    required this.price,
    required this.gorod,
    required this.isNew,
    required this.type,
    required this.diametr,
    required this.krepej,
    required this.description,
    required this.dateOfPublish,
    required this.prosmotry,
    required this.phoneToCall,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      idOfAdver,
      urlToShare,
      name,
      price,
      gorod,
      isNew,
      type,
      diametr,
      krepej,
      description,
      dateOfPublish,
      prosmotry,
      phoneToCall,
    ];
  }

  SingleZapchastiAdvertisement copyWith({
    int? idOfAdver,
    String? urlToShare,
    String? name,
    String? price,
    String? gorod,
    bool? isNew,
    String? type,
    String? diametr,
    String? krepej,
    String? description,
    String? dateOfPublish,
    int? prosmotry,
    String? phoneToCall,
  }) {
    return SingleZapchastiAdvertisement(
      idOfAdver: idOfAdver ?? this.idOfAdver,
      urlToShare: urlToShare ?? this.urlToShare,
      name: name ?? this.name,
      price: price ?? this.price,
      gorod: gorod ?? this.gorod,
      isNew: isNew ?? this.isNew,
      type: type ?? this.type,
      diametr: diametr ?? this.diametr,
      krepej: krepej ?? this.krepej,
      description: description ?? this.description,
      dateOfPublish: dateOfPublish ?? this.dateOfPublish,
      prosmotry: prosmotry ?? this.prosmotry,
      phoneToCall: phoneToCall ?? this.phoneToCall,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOfAdver': idOfAdver,
      'urlToShare': urlToShare,
      'name': name,
      'price': price,
      'gorod': gorod,
      'isNew': isNew,
      'type': type,
      'diametr': diametr,
      'krepej': krepej,
      'description': description,
      'dateOfPublish': dateOfPublish,
      'prosmotry': prosmotry,
      'phoneToCall': phoneToCall,
    };
  }

  factory SingleZapchastiAdvertisement.fromMap(Map<String, dynamic> map) {
    return SingleZapchastiAdvertisement(
      idOfAdver: map['idOfAdver'] as int,
      urlToShare: map['urlToShare'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      gorod: map['gorod'] as String,
      isNew: map['isNew'] as bool,
      type: map['type'] as String,
      diametr: map['diametr'] as String,
      krepej: map['krepej'] as String,
      description: map['description'] as String,
      dateOfPublish: map['dateOfPublish'] as String,
      prosmotry: map['prosmotry'] as int,
      phoneToCall: map['phoneToCall'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SingleZapchastiAdvertisement.fromJson(String source) =>
      SingleZapchastiAdvertisement.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
