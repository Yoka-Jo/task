import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/resources/routes_manager.dart';
import 'package:task/presentation/shared/components/show_toast.dart';

import '../../resources/strings_manager.dart';
import '../../shared/components/build_button.dart';
import '../cubit/confirm_registration_code_cubit.dart';

class BuildConfirmRegButton extends StatelessWidget {
  final Map<String, String> confirmData;
  const BuildConfirmRegButton({super.key, required this.confirmData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmRegistrationCodeCubit,
        ConfirmRegistrationCodeState>(
      listener: (context, state) {
        if (state is ConfirmRegistrationCodeSuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.servicesRoute,
            (route) => false,
          );
        }
        if (state is ConfirmRegistrationCodeFailureState) {
          showToast(state.message, ToastState.failure);
        }
      },
      builder: (context, state) {
        final cubit = ConfirmRegistrationCodeCubit.get(context);
        return BuildButton(
            isLoading: state is ConfirmRegistrationCodeLoadingState,
            text: AppStrings.confirmation,
            onPressed: cubit.isInputValid
                ? () => cubit.confirmRegistration(
                      confirmData["emailOrPhone"]!,
                      confirmData["type"]!,
                    )
                : null);
      },
    );
  }
}
