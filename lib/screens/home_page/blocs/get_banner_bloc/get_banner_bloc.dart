// import 'dart:math';

import '../../../../data/api/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_banner_event.dart';
part 'get_banner_state.dart';

class GetBannerBloc extends Bloc<GetBannerEvent, GetBannerState> {
  ApiProvider _apiProvider = ApiProvider();
  GetBannerBloc() : super(GetBannerInitial()) {
    on<GetBannerEvent>((event, emit) async {
      print('STARTED GETBANNERS BLOC');
      emit(GetBannerLoading());
      try {
        List<String>? urls = await _apiProvider.getBanners();
        if (urls != null) {
          emit(GetBannerSuccess(urlsToImages: urls));
        } else
          emit(GetBannerFailure(errorText: 'URLS ARE NULL'));
      } catch (e) {
        print('ERROR IN CATCH GET BANNERS');
        print(e);
        emit(GetBannerFailure(errorText: 'CATCH ERROR $e'));
      }
    });
  }
}
