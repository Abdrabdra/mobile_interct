import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interct_2/data/api/api_provider.dart';

import '../../../../data/models/place_type_model.dart';

part 'get_place_types_event.dart';
part 'get_place_types_state.dart';

class GetPlaceTypesBloc extends Bloc<GetPlaceTypesEvent, GetPlaceTypesState> {
  ApiProvider _apiProvider = ApiProvider();
  GetPlaceTypesBloc() : super(GetPlaceTypesInitial()) {
    on<GetPlaceTypesEvent>((event, emit) async {
      // TODO: implement event handler
      emit(GetPlaceTypesLoading());
      try {
        List<PlaceTypeModel>? list = await _apiProvider.getPlacesType();
        list != null
            ? emit(GetPlaceTypesSuccess(list: list))
            : emit(GetPlaceTypesFailure());
      } catch (e) {
        print(e);
        print('ERROR IN CATCH PLACES TYPE BLOC');
        emit(GetPlaceTypesFailure());
      }
    });
  }
}
