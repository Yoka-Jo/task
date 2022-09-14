import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/shared/components/show_toast.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_button.dart';
import '../cubit/register_cubit.dart';

class BuildRegisterButton extends StatelessWidget {
  const BuildRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSuccessState) {
        Navigator.of(context).pushNamed(
          Routes.chooseVerificationTypeRoute,
        );
      }
      if (state is RegisterFailureState) {
        showToast(state.message, ToastState.failure);
      }
    }, builder: (context, state) {
      final cubit = RegisterCubit.get(context);
      return BuildButton(
        isLoading: state is RegisterLoadingState,
        onPressed: cubit.areInputsValid ? cubit.register : null,
        text: AppStrings.register,
      );
    });
  }
}
