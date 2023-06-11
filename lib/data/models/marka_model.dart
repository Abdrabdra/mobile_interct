// ignore_for_file: public_member_api_docs, sort_constructors_first
class MarkaModel {
  int id;
  String name;
  MarkaModel({
    required this.id,
    required this.name,
  });

  @override
  String toString() => 'MarkModel(markaId: $id, name: $name)';
}
