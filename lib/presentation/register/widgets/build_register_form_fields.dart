import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/build_text_form.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '../cubit/register_cubit.dart';

class BuildRegisterFormFields extends StatefulWidget {
  const BuildRegisterFormFields({Key? key}) : super(key: key);

  @override
  State<BuildRegisterFormFields> createState() =>
      _BuildRegisterFormFieldsState();
}

class _BuildRegisterFormFieldsState extends State<BuildRegisterFormFields> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      context.read<RegisterCubit>().setEmail(emailController.text);
    });
    passwordController.addListener(() {
      context.read<RegisterCubit>().setPassword(passwordController.text);
    });
    confirmPasswordController.addListener(() {
      context
          .read<RegisterCubit>()
          .setConfirmPassword(confirmPasswordController.text);
    });
    userNameController.addListener(() {
      context.read<RegisterCubit>().setName(userNameController.text);
    });
    phoneNumberController.addListener(() {
      context.read<RegisterCubit>().setPhoneNumber(phoneNumberController.text);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (contex, state) {
        final cubit = RegisterCubit.get(context);
        return Form(
          child: Column(
            children: [
              BuildTextForm(
                controller: userNameController,
                hintText: AppStrings.userName,
                iconAsset: IconsAsset.user,
                errorText: cubit.errorName,
              ),
              const SizedBox(height: 15.0),
              BuildTextForm(
                controller: phoneNumberController,
                hintText: AppStrings.phoneNumber,
                iconAsset: IconsAsset.mobile,
                errorText: cubit.errorPhoneNumber,
              ),
              const SizedBox(height: 15.0),
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
              const SizedBox(height: 15.0),
              BuildTextForm(
                controller: confirmPasswordController,
                hintText: AppStrings.confirmPassword,
                iconAsset: IconsAsset.lock,
                errorText: cubit.errorConfirmPassword,
              ),
            ],
          ),
        );
      },
    );
  }
}
