import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interct_2/data/api/api_provider.dart';
import 'package:interct_2/data/models/city_model_inter.dart';

part 'get_cities_event.dart';
part 'get_cities_state.dart';

class GetCitiesBloc extends Bloc<GetCitiesEvent, GetCitiesState> {
  ApiProvider _apiProvider = ApiProvider();
  GetCitiesBloc() : super(GetCitiesInitial()) {
    on<GetCities>((event, emit) async {
      // TODO: implement event handler
      emit(GetCitiesLoading());
      try {
        List<CityModelInter>? list = await _apiProvider.getCitiesInter();
        list != null
            ? emit(GetCitiesSuccess(list: list))
            : emit(GetCitiesFailure());
      } catch (e) {
        print(e);
        print('ERROR IN CATCH GET CITIES');
        emit(GetCitiesFailure());
      }
    });
    on<GetCitiesInitialEv>((event, emit) async {
      // TODO: implement event handler
      emit(GetCitiesInitial());
    });
  }
}
