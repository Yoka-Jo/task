import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/confirm_registration_email/cubit/confirm_registration_email_code_cubit.dart';
import 'package:task/presentation/resources/routes_manager.dart';
import 'package:task/presentation/shared/components/show_toast.dart';

import '../../../data/network/requests.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_button.dart';

class BuildSendButton extends StatelessWidget {
  const BuildSendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmRegistrationEmailCubit,
        ConfirmRegistrationEmailState>(
      listener: (context, state) {
        if (state is ConfirmRegistrationEmailFailureState) {
          showToast(state.message, ToastState.failure);
        }
        if (state is ConfirmRegistrationEmailSuccessState) {
          Navigator.of(context)
              .pushNamed(Routes.confirmRegistrationCodeRoute, arguments: {
            "emailOrPhone": ConfirmRegistrationEmailCubit.get(context).email,
            "type": ActiveAccountType.email.name
          });
        }
      },
      builder: (context, state) {
        final cubit = ConfirmRegistrationEmailCubit.get(context);
        return BuildButton(
          isLoading: state is ConfirmRegistrationEmailLoadingState,
          text: AppStrings.send,
          onPressed: cubit.isInputValid ? cubit.confirmRegistrationEmail : null,
        );
      },
    );
  }
}
