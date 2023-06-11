// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_cities_bloc.dart';

abstract class GetCitiesState extends Equatable {
  const GetCitiesState();

  @override
  List<Object> get props => [];
}

class GetCitiesInitial extends GetCitiesState {}

class GetCitiesLoading extends GetCitiesState {}

class GetCitiesSuccess extends GetCitiesState {
  final List<CityModelInter> list;
  GetCitiesSuccess({
    required this.list,
  });

  @override
  List<Object> get props => [list];
}

class GetCitiesFailure extends GetCitiesState {}
