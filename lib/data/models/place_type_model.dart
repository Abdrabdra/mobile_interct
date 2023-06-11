// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlaceTypeModel {
  String name;
  int cost;
  int id;
  PlaceTypeModel({
    required this.name,
    required this.cost,
    required this.id,
  });

  @override
  String toString() => 'PlaceTypeModel(name: $name, cost: $cost, id: $id)';
}
