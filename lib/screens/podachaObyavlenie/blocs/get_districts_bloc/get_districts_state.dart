// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_districts_bloc.dart';

abstract class GetDistrictsState extends Equatable {
  const GetDistrictsState();

  @override
  List<Object> get props => [];
}

class GetDistrictsInitial extends GetDistrictsState {}

class GetDistrictsLoading extends GetDistrictsState {}

class GetDistrictsSuccess extends GetDistrictsState {
  final List<CityModelInter> districts;
  GetDistrictsSuccess({
    required this.districts,
  });

  @override
  List<Object> get props => [districts];
}

class GetDistrictsFailure extends GetDistrictsState {}
