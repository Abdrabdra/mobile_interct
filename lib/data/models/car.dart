// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final int id;
  final String type; //car bike water_bike
  final String marka; // Tesla Audi
  final String model_marka; // Tesla Audi
  final String year; // release year of car
  final String kuzov; //type od kuzov of car kupe/cabriolet/sedan
  final String pokolenie;
  final String dvigatel; // electro benzin dizel
  final String obiem_dvigatela; // electro benzin dizel
  final String privod; //Привод
  final bool isRoleSleva; //руль cлевa?
  final String korobka; // mechanica avtomat
  final bool isNew; // s probegom ili noviy
  final String probeg; // Пробег 120000 km
  final String probeg_type; // km or mill or metr
  final bool isRastomozhen; // rastomozhen v KZ?
  final bool isAvariynaya; // аварийная
  final bool isNa_zakaz; // на заказ?
  final List<String> images_url; // на заказ?
  final String color; // цвет
  final bool isMetallik; // Металлик?
  final String name_Author;
  final String phone_Author;
//
  final String price;
  final String main_photo; // which is in the list of advertisements
  final String city;
  final String date_adv; // data of publish of advertisement
  Car({
    required this.id,
    required this.type,
    required this.marka,
    required this.model_marka,
    required this.year,
    required this.kuzov,
    required this.pokolenie,
    required this.dvigatel,
    required this.obiem_dvigatela,
    required this.privod,
    required this.isRoleSleva,
    required this.korobka,
    required this.isNew,
    required this.probeg,
    required this.probeg_type,
    required this.isRastomozhen,
    required this.isAvariynaya,
    required this.isNa_zakaz,
    required this.images_url,
    required this.color,
    required this.isMetallik,
    required this.name_Author,
    required this.phone_Author,
    //
    required this.price,
    required this.main_photo,
    required this.city,
    required this.date_adv,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        type,
        marka,
        model_marka,
        year,
        kuzov,
        pokolenie,
        dvigatel,
        obiem_dvigatela,
        privod,
        isRoleSleva,
        korobka,
        isNew,
        probeg,
        probeg_type,
        isRastomozhen,
        isNa_zakaz,
        images_url,
        color,
        isMetallik,
        name_Author,
        phone_Author,
        //
        price,
        main_photo,
        city,
        date_adv,
      ];
}
