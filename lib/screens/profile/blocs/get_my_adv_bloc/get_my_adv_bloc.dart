import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/api/api_provider.dart';
import '../../../../data/models/avto/avto_advertisement_tile_model.dart';
import '../../../../data/models/avto_request_model.dart';

part 'get_my_adv_event.dart';
part 'get_my_adv_state.dart';

class GetMyAdvBloc extends Bloc<GetMyAdvEvent, GetAdvertisementsState> {
  ApiProvider _apiProvider = ApiProvider();

  GetMyAdvBloc() : super(GetMyAdvertisementsInitial()) {
    on<GetMyAvtoAdvertisementsEvent>((event, emit) async {
      print('GET MY AVTO ADVERS BLOC');
      emit(GetMyAdvertisementsLoading());
      try {
        List<AvtoAdvertisementTile>? list =
            await _apiProvider.getAvtoAdvers(event.arm);
        list != null
            ? emit(
                GetMyAdvertisementsSuccess(
                  list: list,
                  isReachedMax: list.isEmpty,
                ),
              )
            : emit(GetMyAdvertisementsFailure());
      } catch (e) {
        print(e);
        print(('ERROR IN CATCH GET MY AVTO ADVERS'));
        emit(GetMyAdvertisementsFailure());
      }
    });
  }
}
