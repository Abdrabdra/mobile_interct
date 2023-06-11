// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_regions_cities_bloc.dart';

abstract class GetRegionsCitiesEvent extends Equatable {
  const GetRegionsCitiesEvent();

  @override
  List<Object> get props => [];
}

class GetRegions extends GetRegionsCitiesEvent {
  const GetRegions();

  @override
  List<Object> get props => [];
}

class GetCities extends GetRegionsCitiesEvent {
  const GetCities(
    this.regionId,
  );
  final int regionId;

  @override
  List<Object> get props => [regionId];
}
