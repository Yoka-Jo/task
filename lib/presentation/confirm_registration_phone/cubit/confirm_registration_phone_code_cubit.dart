import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/usecases/active_phone_usecase.dart';

import '../../resources/strings_manager.dart';

part 'confirm_registration_phone_code_state.dart';

class ConfirmRegistrationPhoneCubit
    extends Cubit<ConfirmRegistrationPhoneState> {
  final ActivePhoneUseCase _useCase;
  ConfirmRegistrationPhoneCubit(this._useCase)
      : super(ConfirmRegistrationPhoneInitialState());

  static ConfirmRegistrationPhoneCubit get(BuildContext context) =>
      BlocProvider.of(context);

  String phoneNumber = "";
  String? errorphoneNumber = "";
  bool isInputValid = false;

  void setphoneNumber(String phoneNumber) {
    if (phoneNumber.length == 11) {
      this.phoneNumber = phoneNumber;
      errorphoneNumber = null;
    } else {
      this.phoneNumber = "";
      errorphoneNumber = AppStrings.phoneNumberInvalid;
    }
    validate();
  }

  void validate() {
    isInputValid = phoneNumber.isNotEmpty;
    emit(ConfirmRegistrationPhoneValidateInputState());
  }

  Future<void> confirmRegistrationPhone() async {
    emit(ConfirmRegistrationPhoneLoadingState());

    final response = await _useCase(ActivePhoneRequest(phone: phoneNumber));

    response.fold((failure) {
      emit(ConfirmRegistrationPhoneFailureState(failure.message));
    }, (data) {
      emit(ConfirmRegistrationPhoneSuccessState());
    });
  }
}
