import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/api/api_provider.dart';
import '../../../../data/models/avto/avto_advertisement_tile_model.dart';

part 'get_favorite_advers_event.dart';
part 'get_favorite_advers_state.dart';

class GetFavoriteAdversBloc
    extends Bloc<GetFavoriteAdversEvent, GetFavoriteAdversState> {
  GetFavoriteAdversBloc() : super(GetFavAdvertisementsInitial()) {
    ApiProvider _apiProvider = ApiProvider();
    on<GetFavoriteAdversEvent>((event, emit) async {
      // TODO: implement event handler
      print('FAVORITE ADVERS BLOC');
      emit(GetAdvertisementsLoading());
      try {
        List<AvtoAdvertisementTile>? list =
            await _apiProvider.getFavouriteAdvers();
        list != null
            ? emit(GetAdvertisementsSuccess(list: list))
            : emit(GetAdvertisementsFailure());
      } catch (e) {
        print(e);
        print('ERROR IN CATCH GET FAV ADVERS');
        emit(GetAdvertisementsFailure());
      }
    });
  }
}
