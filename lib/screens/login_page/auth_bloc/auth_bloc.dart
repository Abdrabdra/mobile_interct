import '../../../data/api/api_provider.dart';
import '../../../data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  ApiProvider _apiProvider = ApiProvider();
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      print('STARTED REGISTER BLOC');
      print(event.userModel);
      try {
        await _apiProvider.registerUser(event.userModel)
            ? emit(AuthSuccess())
            : emit(AuthFailure(errorText: 'COULDN\'T REGISTER'));
      } catch (e) {
        print('ERROR IN CATCH REGISTER BLOC');
        print(e);
        emit(AuthFailure(errorText: 'CATCH ERROR '));
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      print('STARTED LOGIN BLOC');
      print(event.userModel);
      try {
        await _apiProvider.loginUser(
                event.userModel.phoneNumber, event.userModel.password)
            ? emit(AuthSuccess())
            : emit(AuthFailure(errorText: 'COULDN\'T LOGIN'));
      } catch (e) {
        print('ERROR IN CATCH LOGIN BLOC');
        print(e);
        emit(AuthFailure(errorText: 'CATCH ERROR'));
      }
    });
  }
}
