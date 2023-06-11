import '../../../../data/api/api_provider.dart';
import '../../../../data/models/region_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_regions_cities_event.dart';
part 'get_regions_cities_state.dart';

class GetRegionsCitiesBloc
    extends Bloc<GetRegionsCitiesEvent, GetRegionsCitiesState> {
  ApiProvider _apiProvider = ApiProvider();
  GetRegionsCitiesBloc() : super(GetRegionsCitiesInitial()) {
    on<GetRegions>((event, emit) async {
      // TODO: implement event handler
      print('GET CITIES REGIONS');
      emit(GetRegionsCitiesLoading());
      try {
        List<RegionModel>? regions = await _apiProvider.getRegions();
        regions != null
            ? emit(GetRegionsCitiesSuccess(listRegions: regions))
            : emit(GetRegionsCitiesFailure());
      } catch (e) {
        print(e);
        print('ERROR IN CATCH GET REGIONS CITIES');
        emit(GetRegionsCitiesFailure());
      }
    });
  }
}
