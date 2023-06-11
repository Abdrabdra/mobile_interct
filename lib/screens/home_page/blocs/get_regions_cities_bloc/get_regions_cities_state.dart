// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_regions_cities_bloc.dart';

abstract class GetRegionsCitiesState extends Equatable {
  const GetRegionsCitiesState();

  @override
  List<Object> get props => [];
}

class GetRegionsCitiesInitial extends GetRegionsCitiesState {}

class GetRegionsCitiesLoading extends GetRegionsCitiesState {}

class GetRegionsCitiesSuccess extends GetRegionsCitiesState {
  final List<RegionModel> listRegions;
  GetRegionsCitiesSuccess({
    required this.listRegions,
  });

  @override
  List<Object> get props => [listRegions];
}

class GetRegionsCitiesFailure extends GetRegionsCitiesState {}
