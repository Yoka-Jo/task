import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/confirm_registration_phone/cubit/confirm_registration_phone_code_cubit.dart';
import 'package:task/presentation/resources/routes_manager.dart';
import 'package:task/presentation/shared/components/show_toast.dart';

import '../../../data/network/requests.dart';
import '../../resources/strings_manager.dart';
import '../../shared/components/build_button.dart';

class BuildSendButton extends StatelessWidget {
  const BuildSendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmRegistrationPhoneCubit,
        ConfirmRegistrationPhoneState>(
      listener: (context, state) {
        if (state is ConfirmRegistrationPhoneFailureState) {
          showToast(state.message, ToastState.failure);
        }
        if (state is ConfirmRegistrationPhoneSuccessState) {
          Navigator.of(context)
              .pushNamed(Routes.confirmRegistrationCodeRoute, arguments: {
            "emailOrPhone":
                ConfirmRegistrationPhoneCubit.get(context).phoneNumber,
            "type": ActiveAccountType.phone.name
          });
        }
      },
      builder: (context, state) {
        final cubit = ConfirmRegistrationPhoneCubit.get(context);
        return BuildButton(
          isLoading: state is ConfirmRegistrationPhoneLoadingState,
          text: AppStrings.send,
          onPressed: cubit.isInputValid ? cubit.confirmRegistrationPhone : null,
        );
      },
    );
  }
}
