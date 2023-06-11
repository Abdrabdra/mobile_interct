import '../../../data/api/api_provider.dart';
import '../../../data/models/single_avto_adv_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_single_adv_event.dart';
part 'get_single_adv_state.dart';

class GetSingleAdvBloc extends Bloc<GetSingleAdvEvent, GetSingleAdvState> {
  ApiProvider _apiProvider = ApiProvider();
  GetSingleAdvBloc() : super(GetSingleAdvInitial()) {
    on<GetInfo>((event, emit) async {
      // TODO: implement event handler
      emit(GetSingleAdvLoading());
      print('GET SINGLE AVTO ADV bloc');
      try {
        SingleAvtoAdvModel? saam =
            await _apiProvider.getSingleAvtoAdvers(event.id);
        saam != null
            ? emit(GetSingleAdvSuccess(saam: saam))
            : emit(GetSingleAdvFailure());
      } catch (e) {
        print(e);
        print('ERROR IN CATCH GET SINGLE AVTO ADV');
        emit(GetSingleAdvFailure());
      }
    });
  }
}
