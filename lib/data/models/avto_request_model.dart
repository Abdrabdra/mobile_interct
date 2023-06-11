// ignore_for_file: public_member_api_docs, sort_constructors_first
class AvtoRequestModel {
  String? yearFrom;
  String? yearTo;
  String? priceFrom;
  String? priceTo;
  // int? regionId;
  int? cityId;
  int? markaId;
  int? modelId;
  int? busId;
  bool? isNew;
  final bool withPhoto;
  final bool isRastomojen;
  final int page;
  AvtoRequestModel({
    this.yearFrom,
    this.yearTo,
    this.priceFrom,
    this.priceTo,
    this.cityId,
    this.markaId,
    this.modelId,
    this.busId,
    this.isNew,
    required this.withPhoto,
    required this.isRastomojen,
    required this.page,
  });

  AvtoRequestModel copyWith({
    String? yearFrom,
    String? yearTo,
    String? priceFrom,
    String? priceTo,
    int? cityId,
    int? markaId,
    int? modelId,
    bool? isNew,
    bool? withPhoto,
    bool? isRastomojen,
    int? page,
  }) {
    return AvtoRequestModel(
      yearFrom: yearFrom ?? this.yearFrom,
      yearTo: yearTo ?? this.yearTo,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      cityId: cityId ?? this.cityId,
      markaId: markaId ?? this.markaId,
      modelId: modelId ?? this.modelId,
      isNew: isNew ?? this.isNew,
      withPhoto: withPhoto ?? this.withPhoto,
      isRastomojen: isRastomojen ?? this.isRastomojen,
      page: page ?? this.page,
    );
  }
}
