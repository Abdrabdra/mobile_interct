import 'package:interct_2/data/api/api_provider.dart';
import 'package:interct_2/data/models/generation_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_generations_event.dart';
part 'get_generations_state.dart';

class GetGenerationsBloc
    extends Bloc<GetGenerationsEvent, GetGenerationsState> {
  ApiProvider _apiProvider = ApiProvider();
  GetGenerationsBloc() : super(GetGenerationsInitial()) {
    on<GetGenerationsEvent>((event, emit) async {
      print('GENERATION MODELS BLOC');
      emit(GetGenerationsLoading());
      try {
        List<GenerationModel>? generations =
            await _apiProvider.getGenerationModel(event.idOfModel);
        generations != null
            ? emit(GetGenerationsSuccess(generations))
            : emit(GetGenerationsFailure());
      } catch (e) {
        print(e);
        print('ERROR IN GENERATION MODELS');
        emit(GetGenerationsFailure());
      }
    });
  }
}
