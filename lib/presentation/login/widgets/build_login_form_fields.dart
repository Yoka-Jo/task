import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/shared/components/build_text_form.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/strings_manager.dart';

import '../cubit/login_cubit.dart';

class BuildLoginFormFields extends StatefulWidget {
  const BuildLoginFormFields({Key? key}) : super(key: key);

  @override
  State<BuildLoginFormFields> createState() => _BuildLoginFormFieldsState();
}

class _BuildLoginFormFieldsState extends State<BuildLoginFormFields> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      context.read<LoginCubit>().setEmail(emailController.text);
    });
    passwordController.addListener(() {
      context.read<LoginCubit>().setPassword(passwordController.text);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      final cubit = LoginCubit.get(context);
      return Form(
        child: Column(
          children: [
            BuildTextForm(
              controller: emailController,
              hintText: AppStrings.email,
              iconAsset: IconsAsset.mail,
              errorText: cubit.errorEmail,
            ),
            const SizedBox(height: 15.0),
            BuildTextForm(
              controller: passwordController,
              hintText: AppStrings.password,
              iconAsset: IconsAsset.lock,
              errorText: cubit.errorPassword,
            ),
          ],
        ),
      );
    });
  }
}
