part of 'confirm_registration_phone_code_cubit.dart';

abstract class ConfirmRegistrationPhoneState {}

class ConfirmRegistrationPhoneInitialState
    extends ConfirmRegistrationPhoneState {}

class ConfirmRegistrationPhoneLoadingState
    extends ConfirmRegistrationPhoneState {}

class ConfirmRegistrationPhoneSuccessState
    extends ConfirmRegistrationPhoneState {}

class ConfirmRegistrationPhoneFailureState
    extends ConfirmRegistrationPhoneState {
  final String message;

  ConfirmRegistrationPhoneFailureState(this.message);
}

class ConfirmRegistrationPhoneValidateInputState
    extends ConfirmRegistrationPhoneState {}
