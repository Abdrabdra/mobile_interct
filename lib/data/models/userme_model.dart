// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserMeModel {
  final int id;
  final String name;
  final String phone;
  int? busId;
  UserMeModel({
    required this.id,
    required this.name,
    required this.phone,
    this.busId,
  });
}
