import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/change_password/change_password_screen.dart';
import 'package:task/presentation/choose_verification_type/choose_verification_type_screen.dart';
import 'package:task/presentation/confirm_registration_code/cofirm_registration_code_screen.dart';
import 'package:task/presentation/confirm_registration_email/confirm_registration_email_screen.dart';
import 'package:task/presentation/confirm_registration_phone/confirm_registration_phone_screen.dart';
import 'package:task/presentation/confirm_resetting_pass_code/cofirm_resetting_pass_code_screen.dart';
import 'package:task/presentation/forgot_password/forgot_password_screen.dart';
import 'package:task/presentation/login/login_screen.dart';
import 'package:task/presentation/register/register_screen.dart';
import 'package:task/presentation/resources/strings_manager.dart';
import 'package:task/presentation/services/services_screen.dart';

import '../../app/dependency_injection.dart';
import '../confirm_registration_code/cubit/confirm_registration_code_cubit.dart';
import '../confirm_registration_email/cubit/confirm_registration_email_code_cubit.dart';
import '../confirm_registration_phone/cubit/confirm_registration_phone_code_cubit.dart';
import '../login/cubit/login_cubit.dart';
import '../register/cubit/register_cubit.dart';
import '../services/cubit/services_cubit.dart';

class Routes {
  static const String loginRoute = "login";
  static const String registerRoute = "register";
  static const String confirmRegistrationEmailRoute =
      "confirm-registration-email";
  static const String confirmRegistrationPhoneRoute =
      "confirm-registration-phone";
  static const String confirmRegistrationCodeRoute =
      "confirm-registration-code";
  static const String confirmResettingPassCodeRoute =
      "confirm-resetting-pass-code";
  static const String changePasswordRoute = "change-password";
  static const String forgotPasswordRoute = "forgot-password";
  static const String chooseVerificationTypeRoute = "choose-verification-type";
  static const String servicesRoute = "services";
}

class RoutesGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => instance<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) {
          return BlocProvider<RegisterCubit>(
            create: (_) => instance<RegisterCubit>(),
            child: const RegisterScreen(),
          );
        });
      case Routes.confirmRegistrationEmailRoute:
        initActiveEmailModule();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => instance<ConfirmRegistrationEmailCubit>(),
                  child: const ConfirmRegistrationEmailScreen(),
                ));
      case Routes.confirmRegistrationPhoneRoute:
        initActivePhoneModule();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => instance<ConfirmRegistrationPhoneCubit>(),
                  child: const ConfirmRegistrationPhoneScreen(),
                ));
      case Routes.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.confirmRegistrationCodeRoute:
        initAciveAccountModule();
        final confirmData = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => instance<ConfirmRegistrationCodeCubit>(),
                  child:
                      ConfirmRegistrationCodeScreen(confirmData: confirmData),
                ));
      case Routes.confirmResettingPassCodeRoute:
        return MaterialPageRoute(
            builder: (_) => const ConfirmResettingPassCodeScreen());
      case Routes.chooseVerificationTypeRoute:
        return MaterialPageRoute(
            builder: (_) => const ChooseVerificationTypeScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.servicesRoute:
        initGetServicesModule();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => instance<ServicesCubit>(),
                  child: const ServicesScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const NoScreenFound());
    }
  }
}

class NoScreenFound extends StatelessWidget {
  const NoScreenFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppStrings.noScreenFound,
            style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
