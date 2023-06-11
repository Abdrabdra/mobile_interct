import '../../../../data/api/api_provider.dart';
// import '../../../../data/models/region_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models/marka_model.dart';
import '../../../../../data/models/model_model.dart';

part 'get_marka_models_event.dart';
part 'get_marka_models_state.dart';

class GetMarkasModelsBloc
    extends Bloc<GetMarkasModelsEvent, GetMarkasModelsState> {
  ApiProvider _apiProvider = ApiProvider();
  GetMarkasModelsBloc() : super(GetMarkasModelsInitial()) {
    on<GetMarkas>((event, emit) async {
      // TODO: implement event handler
      print('GET MARKAS');
      emit(GetMarkasModelsLoading());
      try {
        List<MarkaModel>? markas = await _apiProvider.getMarkas();
        markas != null
            ? emit(GetMarkasModelsSuccess(listMarkas: markas, listModels: []))
            : emit(GetMarkasModelsFailure());
      } catch (e) {
        print(e);
        print('ERROR IN CATCH GET MARKAS');
        emit(GetMarkasModelsFailure());
      }
    });

    on<GetModels>((event, emit) async {
      // TODO: implement event handler
      print('GET MODELS');
      emit(GetMarkasModelsLoading());
      try {
        List<ModelModel>? models = await _apiProvider.getModels(event.markaId);
        models != null
            ? emit(GetMarkasModelsSuccess(listMarkas: [], listModels: models))
            : emit(GetMarkasModelsFailure());
      } catch (e) {
        print(e);
        print('ERROR IN CATCH GET MODELS');
        emit(GetMarkasModelsFailure());
      }
    });
  }
}
