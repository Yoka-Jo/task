part of 'confirm_registration_code_cubit.dart';

abstract class ConfirmRegistrationCodeState {}

class ConfirmRegistrationCodeInitialState extends ConfirmRegistrationCodeState {
}

class ConfirmRegistrationCodeLoadingState extends ConfirmRegistrationCodeState {
}

class ConfirmRegistrationCodeSuccessState extends ConfirmRegistrationCodeState {
}

class ConfirmRegistrationCodeFailureState extends ConfirmRegistrationCodeState {
  final String message;

  ConfirmRegistrationCodeFailureState(this.message);
}

class ConfirmRegistrationCodeValidateInputsState
    extends ConfirmRegistrationCodeState {}
