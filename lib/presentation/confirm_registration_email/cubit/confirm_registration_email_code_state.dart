part of 'confirm_registration_email_code_cubit.dart';

abstract class ConfirmRegistrationEmailState {}

class ConfirmRegistrationEmailInitialState
    extends ConfirmRegistrationEmailState {}

class ConfirmRegistrationEmailLoadingState
    extends ConfirmRegistrationEmailState {}

class ConfirmRegistrationEmailSuccessState
    extends ConfirmRegistrationEmailState {}

class ConfirmRegistrationEmailFailureState
    extends ConfirmRegistrationEmailState {
  final String message;

  ConfirmRegistrationEmailFailureState(this.message);
}

class ConfirmRegistrationEmailValidateInputState
    extends ConfirmRegistrationEmailState {}
