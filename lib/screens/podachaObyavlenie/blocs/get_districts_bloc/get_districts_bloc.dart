import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interct_2/data/api/api_provider.dart';
import 'package:interct_2/data/models/city_model_inter.dart';

part 'get_districts_event.dart';
part 'get_districts_state.dart';

class GetDistrictsBloc extends Bloc<GetDistrictsEvent, GetDistrictsState> {
  ApiProvider _apiProvider = ApiProvider();
  GetDistrictsBloc() : super(GetDistrictsInitial()) {
    on<GetDistricts>((event, emit) async {
      emit(GetDistrictsLoading());
      try {
        List<CityModelInter>? districts =
            await _apiProvider.getDistrictsInter(event.idOfCity);
        districts != null
            ? emit(GetDistrictsSuccess(districts: districts))
            : emit(GetDistrictsInitial());
      } catch (e) {
        print(e);
        print('ERROR CATCH DISTRICTS');
        emit(GetDistrictsFailure());
      }
    });
    on<GetDistrictsInitialEv>((event, emit) {
      emit(GetDistrictsInitial());
    });
  }
}
