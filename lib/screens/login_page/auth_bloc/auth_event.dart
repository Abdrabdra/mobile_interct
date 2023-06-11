// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent(
    this.userModel,
  );
  final UserModel userModel;

  @override
  List<Object> get props => [userModel];
}

class LoginEvent extends AuthEvent {
  const LoginEvent(
    this.userModel,
  );
  final UserModel userModel;

  @override
  List<Object> get props => [userModel];
}
