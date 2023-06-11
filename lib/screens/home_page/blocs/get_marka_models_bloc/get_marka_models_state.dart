// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_marka_models_bloc.dart';

abstract class GetMarkasModelsState extends Equatable {
  const GetMarkasModelsState();

  @override
  List<Object> get props => [];
}

class GetMarkasModelsInitial extends GetMarkasModelsState {}

class GetMarkasModelsLoading extends GetMarkasModelsState {}

class GetMarkasModelsSuccess extends GetMarkasModelsState {
  final List<MarkaModel> listMarkas;
  final List<ModelModel> listModels;
  GetMarkasModelsSuccess({
    required this.listMarkas,
    required this.listModels,
  });

  @override
  List<Object> get props => [listMarkas, listModels];
}

class GetMarkasModelsFailure extends GetMarkasModelsState {}
