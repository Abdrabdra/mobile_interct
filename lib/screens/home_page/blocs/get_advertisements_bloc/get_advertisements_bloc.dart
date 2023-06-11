import '../../../../data/api/api_provider.dart';
import '../../../../data/models/avto/avto_advertisement_tile_model.dart';
import '../../../../data/models/avto_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_advertisements_event.dart';
part 'get_advertisements_state.dart';

class GetAdvertisementsBloc
    extends Bloc<GetAdvertisementsEvent, GetAdvertisementsState> {
  ApiProvider _apiProvider = ApiProvider();
  GetAdvertisementsBloc() : super(GetAdvertisementsInitial()) {
    on<GetAvtoAdvertisementsEvent>((event, emit) async {
      // TODO: implement event handler
      print('GET AVTO ADVERS BLOC');
      emit(GetAdvertisementsLoading());
      try {
        List<AvtoAdvertisementTile>? list =
            await _apiProvider.getAvtoAdvers(event.arm);
        if (list != null) {
          emit(
            GetAdvertisementsSuccess(
              list: list,
              isReachedMax: list.isEmpty,
            ),
          );
        } else
          emit(GetAdvertisementsFailure());
      } catch (e) {
        print(e);
        print(('ERROR IN CATCH GET AVTO ADVERS'));
        emit(GetAdvertisementsFailure());
      }
    });
    on<GetNextAvtoAdvertisementsEvent>((event, emit) async {
      // TODO: implement event handler
      print('GET NEXT AVTO ADVERS BLOC');
      final _currentState = state as GetAdvertisementsSuccess;

      // emit(GetNextAdvertisementsLoading(
      //     list: _currentState.list, isReachedMax: _currentState.isReachedMax));
      try {
        List<AvtoAdvertisementTile>? listNew =
            await _apiProvider.getAvtoAdvers(event.arm);

        if (listNew != null) {
          print('newList is empty ${listNew.isEmpty}');
          emit(
            _currentState.copyWith(
              list: _currentState.list + listNew,
              isReachedMax: listNew.isEmpty,
            ),
          );
        } else {
          emit(GetAdvertisementsFailure());
        }
      } catch (e) {
        print(e);
        print(('ERROR IN CATCH GET AVTO ADVERS'));
        emit(GetAdvertisementsFailure());
      }
    });
  }
}
