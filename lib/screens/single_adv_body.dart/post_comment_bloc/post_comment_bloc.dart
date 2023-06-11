import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interct_2/data/api/api_provider.dart';

import '../../../data/models/comment_model_inter.dart';

part 'post_comment_event.dart';
part 'post_comment_state.dart';

class PostCommentBloc extends Bloc<PostCommentEVs, PostCommentState> {
  ApiProvider _apiProvider = ApiProvider();
  PostCommentBloc() : super(PostCommentInitial()) {
    on<PostCommentEvent>((event, emit) async {
      emit(PostCommentLoading());
      try {
        await _apiProvider.postCommet(event.cmi)
            ? emit(PostCommentSuccess())
            : emit(PostCommentFailure());
      } catch (e) {
        print(e);
        print('ERROR POST COMMENT BLOC');
        emit(PostCommentFailure());
      }
    });
    on<EmitInit>(
      (event, emit) => emit(PostCommentInitial()),
    );
  }
}
