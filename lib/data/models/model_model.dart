// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelModel {
  int id;
  String name;
  ModelModel({
    required this.id,
    required this.name,
  });

  @override
  String toString() => 'ModelModel(modelId: $id, name: $name)';
}
