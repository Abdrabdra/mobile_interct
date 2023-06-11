// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_tickets_bloc.dart';

abstract class GetTicketsState extends Equatable {
  const GetTicketsState();

  @override
  List<Object> get props => [];
}

class GetTicketsInitial extends GetTicketsState {}

class GetTicketsLoading extends GetTicketsState {}

class GetTicketsSuccess extends GetTicketsState {
  final List<TicketModel> listTickets;
  GetTicketsSuccess({
    required this.listTickets,
  });

  @override
  List<Object> get props => [listTickets];
}

class GetTicketsFailure extends GetTicketsState {}
