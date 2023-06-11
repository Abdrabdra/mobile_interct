// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data/models/city_model.dart';

class RegionModel {
  int idRegion;
  String nameRegion;
  List<CityModel> cities;
  RegionModel({
    required this.idRegion,
    required this.nameRegion,
    required this.cities,
  });

  @override
  String toString() =>
      'RegionModel(idRegion: $idRegion, nameRegion: $nameRegion, cities: $cities)';
}
