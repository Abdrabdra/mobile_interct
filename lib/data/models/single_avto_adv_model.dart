// ignore_for_file: public_member_api_docs, sort_constructors_first
class SingleAvtoAdvModel {
  int id;
  int price;
  String cityFrom;
  String cityTo;
  String districtFrom;
  String districtTo;
  String arrivalDate;
  String arrivalTime;
  String authorPhone;
  String authorId;
  List<String> imageUrls;
  int busTypeId;
  int busId;
  List<bool> availablePlaces;
  List<int> placeIds;
  // int year;
  // String probeg;
  // String obiem;
  // String sostoyanie;
  // String driveUnit;
  // String rule;
  // bool customsClearance;
  // bool isLiked;
  // String likes;
  // String comments;
  // int view;
  // bool isRecommended;
  // bool isTop;
  SingleAvtoAdvModel({
    required this.id,
    required this.price,
    required this.cityFrom,
    required this.cityTo,
    required this.districtFrom,
    required this.districtTo,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.authorPhone,
    required this.authorId,
    required this.imageUrls,
    this.busTypeId = 15,
    required this.busId,
    required this.availablePlaces,
    required this.placeIds,
  });

  @override
  String toString() {
    return 'SingleAvtoAdvModel(id: $id, price: $price, cityFrom: $cityFrom, cityTo: $cityTo, districtFrom: $districtFrom, districtTo: $districtTo, arrivalDate: $arrivalDate, arrivalTime: $arrivalTime, authorPhone: $authorPhone, authorId: $authorId, imageUrls: $imageUrls, busTypeId: $busTypeId, busId: $busId, availablePlaces: $availablePlaces, placeIds: $placeIds)';
  }
}
