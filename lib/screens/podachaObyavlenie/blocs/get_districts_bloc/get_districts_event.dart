// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_districts_bloc.dart';

abstract class GetDistrictsEvent extends Equatable {
  const GetDistrictsEvent();

  @override
  List<Object> get props => [];
}

class GetDistricts extends GetDistrictsEvent {
  const GetDistricts(
    this.idOfCity,
  );
  final int idOfCity;

  @override
  List<Object> get props => [idOfCity];
}

class GetDistrictsInitialEv extends GetDistrictsEvent {}
