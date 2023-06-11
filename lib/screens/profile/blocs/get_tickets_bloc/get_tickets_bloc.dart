import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interct_2/data/api/api_provider.dart';

import '../../../../data/models/ticket_model.dart';

part 'get_tickets_event.dart';
part 'get_tickets_state.dart';

class GetTicketsBloc extends Bloc<GetTicketsEVs, GetTicketsState> {
  ApiProvider _apiProvider = ApiProvider();
  GetTicketsBloc() : super(GetTicketsInitial()) {
    on<GetTicketsEVs>((event, emit) async {
      emit(GetTicketsLoading());
      try {
        List<TicketModel>? listTickets = await _apiProvider.getMyTickets();
        listTickets != null
            ? emit(GetTicketsSuccess(listTickets: listTickets))
            : emit(GetTicketsFailure());
      } catch (e) {
        print(e);
        print('ERROR GET TICKETS BLOC');
        emit(GetTicketsFailure());
      }
    });
  }
}
