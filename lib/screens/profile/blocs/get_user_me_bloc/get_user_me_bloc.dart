import 'package:interct_2/data/api/api_provider.dart';
import 'package:interct_2/data/models/userme_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_user_me_event.dart';
part 'get_user_me_state.dart';

class GetUserMeBloc extends Bloc<GetUserMeEvent, GetUserMeState> {
  ApiProvider _apiProvider = ApiProvider();
  GetUserMeBloc() : super(GetUserMeInitial()) {
    on<GetUserMeEvent>((event, emit) async {
      print('GET USER ME BLOC');
      emit(GetUserMeLoading());
      try {
        UserMeModel? umm = await _apiProvider.getUserMe();
        umm != null
            ? emit(GetUserMeSuccess(umm: umm))
            : emit(GetUserMeFailure());
      } catch (e) {
        print(e);
        print('ERROR GET USER ME');
        emit(GetUserMeFailure());
      }
    });
  }
}
