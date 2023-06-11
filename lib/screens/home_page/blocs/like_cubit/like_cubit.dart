import '../../../../data/api/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeInitial());
  ApiProvider _apiProvider = ApiProvider();
  void likeAdver(int id) async {
    print('LIKE CUBIT $id');
    try {
      await _apiProvider.likeAdver(id)
          ? emit(LikeSuccess())
          : emit(LikeFailure());
    } catch (e) {
      print(e);
      print('ERROR IN LIKE CUBIT');
      emit(LikeFailure());
    }
  }
}
