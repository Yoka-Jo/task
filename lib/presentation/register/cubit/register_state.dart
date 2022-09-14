part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String message;

  RegisterFailureState(this.message);
}

class RegisterValidateInputsState extends RegisterState {}
