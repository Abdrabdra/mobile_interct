// ignore_for_file: public_member_api_docs, sort_constructors_first
class CityModel {
  int idCity;
  String name;
  CityModel({
    required this.idCity,
    required this.name,
  });

  @override
  String toString() => 'CityModel(id: $idCity, name: $name)';
}
