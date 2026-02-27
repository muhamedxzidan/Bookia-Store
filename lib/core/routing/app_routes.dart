import 'package:bookia_store/core/routing/routes.dart';
import 'package:bookia_store/features/auth/Presentation/create_new_password.dart';
import 'package:bookia_store/features/auth/Presentation/forgot_password.dart';
import 'package:bookia_store/features/auth/Presentation/login_screen.dart';
import 'package:bookia_store/features/auth/Presentation/otp_verification.dart';
import 'package:bookia_store/features/auth/Presentation/password_changed.dart';
import 'package:bookia_store/features/auth/Presentation/register_screen.dart';
import 'package:bookia_store/features/buttom_nav_bar/Presentation/bottom_nav_bar_screen.dart';
import 'package:bookia_store/features/home/Presentation/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case Routes.otpVerification:
        return MaterialPageRoute(builder: (_) => const OtpVerification());
      case Routes.createNewPassword:
        return MaterialPageRoute(builder: (_) => const CreateNewPassword());
      case Routes.passwordChanged:
        return MaterialPageRoute(builder: (_) => const PasswordChanged());
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
