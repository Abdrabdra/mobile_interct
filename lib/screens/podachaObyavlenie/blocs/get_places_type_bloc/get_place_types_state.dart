// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_place_types_bloc.dart';

abstract class GetPlaceTypesState extends Equatable {
  const GetPlaceTypesState();

  @override
  List<Object> get props => [];
}

class GetPlaceTypesInitial extends GetPlaceTypesState {}

class GetPlaceTypesLoading extends GetPlaceTypesState {}

class GetPlaceTypesSuccess extends GetPlaceTypesState {
  final List<PlaceTypeModel> list;
  GetPlaceTypesSuccess({
    required this.list,
  });

  @override
  List<Object> get props => [list];
}

class GetPlaceTypesFailure extends GetPlaceTypesState {}
