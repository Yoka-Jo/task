import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/app/functions.dart';
import 'package:task/app/globals.dart';
import 'package:task/domain/usecases/login_usecase.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import '../../../app/extensions.dart';
import '../../../data/network/requests.dart';
import '../../shared/freezed/freezed_data_classes.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _useCase;
  LoginCubit(this._useCase) : super(LoginInitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  LoginObject registerObject = LoginObject(email: "", password: "");
  bool areInputsValid = false;
  String? errorEmail;
  String? errorPassword;

  Future<void> login() async {
    emit(LoginLoadingState());
    final response = await _useCase(LoginRequest(
        email: registerObject.email,
        password: registerObject.password,
        tokenFirebase: firebaseToken.orEmpty(),
        deviceId: deviceId.orEmpty()));

    response.fold(
      (failure) {
        emit(LoginFailureState(failure.message));
      },
      (data) {
        emit(LoginSuccessState());
      },
    );
  }

  void setEmail(String email) {
    if (isEmailValid(email)) {
      registerObject = registerObject.copyWith(email: email);
      errorEmail = null;
    } else {
      registerObject = registerObject.copyWith(email: "");
      errorEmail = AppStrings.emailInvalid;
    }
    validate();
  }

  void setPassword(String password) {
    if (isPasswordValid(password)) {
      registerObject = registerObject.copyWith(password: password);
      errorPassword = null;
    } else {
      registerObject = registerObject.copyWith(password: "");
      errorPassword = AppStrings.passwordInvalid;
    }
    validate();
  }

  void validate() {
    areInputsValid =
        registerObject.email.isNotEmpty && registerObject.password.isNotEmpty;
    emit(LoginValidateInputsState());
  }
}
