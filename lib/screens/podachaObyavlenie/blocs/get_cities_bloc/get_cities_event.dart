part of 'get_cities_bloc.dart';

abstract class GetCitiesEvent extends Equatable {
  const GetCitiesEvent();

  @override
  List<Object> get props => [];
}

class GetCities extends GetCitiesEvent {
  const GetCities();

  @override
  List<Object> get props => [];
}

class GetCitiesInitialEv extends GetCitiesEvent {}
