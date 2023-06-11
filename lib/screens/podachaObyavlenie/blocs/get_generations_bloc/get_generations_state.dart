part of 'get_generations_bloc.dart';

abstract class GetGenerationsState extends Equatable {
  const GetGenerationsState();
  
  @override
  List<Object> get props => [];
}

class GetGenerationsInitial extends GetGenerationsState {}

class GetGenerationsLoading extends GetGenerationsState {}

class GetGenerationsSuccess extends GetGenerationsState {
  final List<GenerationModel> generations;

  GetGenerationsSuccess(this.generations);

  @override
  List<Object> get props => [generations];
}

class GetGenerationsFailure extends GetGenerationsState {}
