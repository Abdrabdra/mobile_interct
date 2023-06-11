part of 'get_tickets_bloc.dart';

abstract class GetTicketsEVs extends Equatable {
  const GetTicketsEVs();

  @override
  List<Object> get props => [];
}

class GetTicketsEvent extends GetTicketsEVs {
  const GetTicketsEvent();

  @override
  List<Object> get props => [];
}

class EmitInit extends GetTicketsEVs {}
