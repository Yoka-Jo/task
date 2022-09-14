import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/usecases/acive_account_usecase.dart';
import 'package:task/presentation/resources/strings_manager.dart';

part 'confirm_registration_code_state.dart';

class ConfirmRegistrationCodeCubit extends Cubit<ConfirmRegistrationCodeState> {
  final ActiveAccountUseCase _useCase;
  ConfirmRegistrationCodeCubit(this._useCase)
      : super(ConfirmRegistrationCodeInitialState());

  static ConfirmRegistrationCodeCubit get(BuildContext context) =>
      BlocProvider.of(context);

  String pinCode = "";
  String? errorPinCode = "";
  bool isInputValid = false;

  void setPinCode(String pinCode) {
    if (pinCode.length < 4) {
      this.pinCode = "";
      errorPinCode = AppStrings.pinCodeInvalid;
    } else {
      this.pinCode = pinCode;
      errorPinCode = null;
    }
    validateInput();
  }

  void validateInput() {
    isInputValid = pinCode.isNotEmpty;
    emit(ConfirmRegistrationCodeValidateInputsState());
  }

  Future<void> confirmRegistration(String phoneOrEmail, String type) async {
    emit(ConfirmRegistrationCodeLoadingState());

    final response = await _useCase(ActiveAccountRequest(
      phoneOrEmail: phoneOrEmail,
      code: pinCode,
      type: type,
    ));

    response.fold((failure) {
      emit(ConfirmRegistrationCodeFailureState(failure.message));
    }, (data) {
      emit(ConfirmRegistrationCodeSuccessState());
    });
  }
}
