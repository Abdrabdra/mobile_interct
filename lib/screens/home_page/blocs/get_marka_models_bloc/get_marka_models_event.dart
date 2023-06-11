// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_marka_models_bloc.dart';

abstract class GetMarkasModelsEvent extends Equatable {
  const GetMarkasModelsEvent();

  @override
  List<Object> get props => [];
}

class GetMarkas extends GetMarkasModelsEvent {
  const GetMarkas();

  @override
  List<Object> get props => [];
}

class GetModels extends GetMarkasModelsEvent {
  const GetModels(
    this.markaId,
  );
  final int markaId;

  @override
  List<Object> get props => [markaId];
}
