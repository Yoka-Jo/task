import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/shared/components/build_text_form.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';

import '../cubit/confirm_registration_phone_code_cubit.dart';

class BuildConfirmRegFormField extends StatefulWidget {
  const BuildConfirmRegFormField({Key? key}) : super(key: key);

  @override
  State<BuildConfirmRegFormField> createState() =>
      _BuildConfirmRegFormFieldState();
}

class _BuildConfirmRegFormFieldState extends State<BuildConfirmRegFormField> {
  final TextEditingController phoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneNumber.addListener(() {
      context
          .read<ConfirmRegistrationPhoneCubit>()
          .setphoneNumber(phoneNumber.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmRegistrationPhoneCubit,
        ConfirmRegistrationPhoneState>(builder: (context, state) {
      final cubit = ConfirmRegistrationPhoneCubit.get(context);
      return Form(
        child: BuildTextForm(
          controller: phoneNumber,
          hintText: AppStrings.phoneNumber,
          iconAsset: IconsAsset.mobile,
          errorText: cubit.errorphoneNumber,
        ),
      );
    });
  }
}
