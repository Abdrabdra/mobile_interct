// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:interct_2/data/models/region_model.dart';
import 'package:image_picker/image_picker.dart';

class PodachaAvtoAdver {
  final String? type; // avto moto vodnyi
  final int? marka; // audi acura alfa Romeo
  final int? model; // a1 a2 a3
  final String? yearOfProduct;
  final int? typeKuzov; // liftbek cabriolet sedan
  final int? pokolenie;
  final String? typeDvigatel; // benzin dizel
  final String? privod; // perednyi zadnyi
  final String? korobkaPeredach; // avtomat mechanic
  final String? rule; // leviy pravyi
  // final String modification; // wanna know what is it
  final bool? isNew; // s probegom / novaya
  final String? probeg;
  final bool? isRastomojenInKZ;
  final bool? isAvariynaya;
  final bool? isNaZakaz;
  final int? price;
  final List<XFile>? urlToImages;
  final String? color;
  final bool? isMetallik;
  final int? gorod;
  final String? nameOfAuthor;
  final String? phoneOfAuthor;
  final int? idOfUser;
  final int? idOfRegion;
  final List<RegionModel>? regions;
  PodachaAvtoAdver({
    this.regions,
    this.idOfRegion,
    this.type,
    this.marka,
    this.model,
    this.yearOfProduct,
    this.typeKuzov,
    this.pokolenie,
    this.typeDvigatel,
    this.privod,
    this.korobkaPeredach,
    this.rule,
    this.isNew,
    this.probeg,
    this.isRastomojenInKZ,
    this.isAvariynaya,
    this.isNaZakaz,
    this.price,
    this.urlToImages,
    this.color,
    this.isMetallik,
    this.gorod,
    this.nameOfAuthor,
    this.phoneOfAuthor,
    this.idOfUser,
  });
  PodachaAvtoAdver copyWith({
    String? type, // avto moto vodnyi
    final int? marka, // audi acura alfa Romeo
    final int? model, // a1 a2 a3
    final String? yearOfProduct,
    final int? typeKuzov, // liftbek cabriolet sedan
    final int? pokolenie,
    final String? typeDvigatel, // benzin dizel
    final String? privod, // perednyi zadnyi
    final String? korobkaPeredach, // avtomat mechanic
    final String? rule, // leviy pravyi
    // final String modification; // wanna know what is it
    final bool? isNew, // s probegom / novaya
    final String? probeg,
    final bool? isRastomojenInKZ,
    final bool? isAvariynaya,
    final bool? isNaZakaz,
    final int? price,
    final List<XFile>? urlToImages,
    final String? color,
    final bool? isMetallik,
    final int? idOfCity,
    final String? nameOfAuthor,
    final String? phoneOfAuthor,
    final int? idOfUser,
    final int? idOfRegion,
    final List<RegionModel>? regions,
  }) {
    return PodachaAvtoAdver(
        marka: marka ?? this.marka,
        model: model ?? this.model,
        yearOfProduct: yearOfProduct ?? this.yearOfProduct,
        typeKuzov: typeKuzov ?? this.typeKuzov,
        pokolenie: pokolenie ?? this.pokolenie,
        typeDvigatel: typeDvigatel ?? this.typeDvigatel,
        privod: privod ?? this.privod,
        korobkaPeredach: korobkaPeredach ?? this.korobkaPeredach,
        rule: rule ?? this.rule,
        isNew: isNew ?? this.isNew,
        probeg: probeg ?? this.probeg,
        isRastomojenInKZ: isRastomojenInKZ ?? this.isRastomojenInKZ,
        isAvariynaya: isAvariynaya ?? this.isAvariynaya,
        isNaZakaz: isNaZakaz ?? this.isNaZakaz,
        price: price ?? this.price,
        urlToImages: urlToImages ?? this.urlToImages,
        color: color ?? this.color,
        isMetallik: isMetallik ?? this.isMetallik,
        gorod: gorod ?? this.gorod,
        nameOfAuthor: nameOfAuthor ?? this.nameOfAuthor,
        phoneOfAuthor: phoneOfAuthor ?? this.phoneOfAuthor,
        idOfUser: idOfUser ?? this.idOfUser,
        idOfRegion: idOfRegion ?? this.idOfRegion,
        regions: regions ?? this.regions);
  }

  // @override
  // // TODO: implement props
  // List<Object> get props {
  //   return [
  //     type!,
  //     marka1!,
  //     marka2!,
  //     yearOfProduct!,
  //     typeKuzov!,
  //     pokolenie!,
  //     typeDvigatel!,
  //     privod!,
  //     korobkaPeredach!,
  //     rule!,
  //     isNew!,
  //     probeg!,
  //     isRastomojenInKZ!,
  //     isAvariynaya!,
  //     isNaZakaz!,
  //     price!,
  //     urlToImages!,
  //     color!,
  //     isMetallik!,
  //     gorod!,
  //     nameOfAuthor!,
  //     phoneOfAuthor!,
  //     idOfUser!,
  //   ];
  // }
}
