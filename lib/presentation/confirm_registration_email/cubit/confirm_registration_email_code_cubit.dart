import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/usecases/active_email_usecase.dart';

import '../../../app/functions.dart';
import '../../resources/strings_manager.dart';

part 'confirm_registration_email_code_state.dart';

class ConfirmRegistrationEmailCubit
    extends Cubit<ConfirmRegistrationEmailState> {
  final ActiveEmailUseCase _useCase;
  ConfirmRegistrationEmailCubit(this._useCase)
      : super(ConfirmRegistrationEmailInitialState());

  static ConfirmRegistrationEmailCubit get(BuildContext context) =>
      BlocProvider.of(context);

  String email = "";
  String? errorEmail = "";
  bool isInputValid = false;

  void setEmail(String email) {
    if (isEmailValid(email)) {
      this.email = email;
      errorEmail = null;
    } else {
      this.email = "";
      errorEmail = AppStrings.emailInvalid;
    }
    validate();
  }

  void validate() {
    isInputValid = email.isNotEmpty;
    emit(ConfirmRegistrationEmailValidateInputState());
  }

  Future<void> confirmRegistrationEmail() async {
    emit(ConfirmRegistrationEmailLoadingState());

    final response = await _useCase(ActiveEmailRequest(email: email));

    response.fold((failure) {
      emit(ConfirmRegistrationEmailFailureState(failure.message));
    }, (data) {
      emit(ConfirmRegistrationEmailSuccessState());
    });
  }
}
