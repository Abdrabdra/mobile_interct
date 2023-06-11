import 'package:interct_2/data/api/api_provider.dart';
import 'package:interct_2/data/models/podacha_adver_model/podacha_avto_adver.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_advers_event.dart';
part 'post_advers_state.dart';

class PostAdversBloc extends Bloc<PostAdversEvent, PostAdversState> {
  ApiProvider _apiProvider = ApiProvider();
  PostAdversBloc() : super(PostAdversInitial()) {
    on<PostAdversEvent>((event, emit) async {
      print('POST ADVERS BLOC');
      emit(PostAdversLoading());
      try {
        await _apiProvider.postAdvers(event.paa)
            ? emit(PostAdversSuccess())
            : emit(PostAdversFailure());
      } catch (e) {
        print(e);
        print('ERROR POST ADVERS BLOC');
        emit(PostAdversFailure());
      }
    });
  }
}
