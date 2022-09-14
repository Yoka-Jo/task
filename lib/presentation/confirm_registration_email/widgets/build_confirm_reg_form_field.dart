import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/shared/components/build_text_form.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';

import '../cubit/confirm_registration_email_code_cubit.dart';

class BuildConfirmRegFormField extends StatefulWidget {
  const BuildConfirmRegFormField({Key? key}) : super(key: key);

  @override
  State<BuildConfirmRegFormField> createState() =>
      _BuildConfirmRegFormFieldState();
}

class _BuildConfirmRegFormFieldState extends State<BuildConfirmRegFormField> {
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      context
          .read<ConfirmRegistrationEmailCubit>()
          .setEmail(emailController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmRegistrationEmailCubit,
        ConfirmRegistrationEmailState>(builder: (context, state) {
      final cubit = ConfirmRegistrationEmailCubit.get(context);
      return Form(
        child: BuildTextForm(
          controller: emailController,
          hintText: AppStrings.email,
          iconAsset: IconsAsset.mobile,
          errorText: cubit.errorEmail,
        ),
      );
    });
  }
}
