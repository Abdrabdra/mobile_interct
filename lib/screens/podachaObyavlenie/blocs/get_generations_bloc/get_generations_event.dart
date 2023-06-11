part of 'get_generations_bloc.dart';

 class GetGenerationsEvent extends Equatable {
  const GetGenerationsEvent(this.idOfModel);
  final int idOfModel;
  @override
  List<Object> get props => [idOfModel];
}
