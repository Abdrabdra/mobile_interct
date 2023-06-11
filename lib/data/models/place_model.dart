// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlaceBusModel {
  bool isAvailable;
  int placeId;
  PlaceBusModel({
    required this.isAvailable,
    required this.placeId,
  });

  @override
  String toString() =>
      'PlaceBusModel(isAvailable: $isAvailable, placeId: $placeId)';
}
