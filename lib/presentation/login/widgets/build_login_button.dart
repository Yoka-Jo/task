import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/shared/components/show_toast.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_button.dart';
import '../cubit/login_cubit.dart';

class BuildLoginButton extends StatelessWidget {
  const BuildLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        Navigator.of(context).pushReplacementNamed(Routes.servicesRoute);
      }
      if (state is LoginFailureState) {
        showToast(state.message, ToastState.failure);
      }
    }, builder: (context, state) {
      final cubit = LoginCubit.get(context);
      return Center(
        child: BuildButton(
          isLoading: state is LoginLoadingState,
          onPressed: cubit.areInputsValid ? cubit.login : null,
          text: AppStrings.enter,
        ),
      );
    });
  }
}
