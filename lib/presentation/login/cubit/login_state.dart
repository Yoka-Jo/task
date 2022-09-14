// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String message;
  LoginFailureState(
    this.message,
  );
}

class LoginValidateInputsState extends LoginState {}
