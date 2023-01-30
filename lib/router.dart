import 'package:flutter/material.dart';
import 'package:hariya_education_institute/auth/screens/login_screen.dart';
import 'package:hariya_education_institute/auth/screens/otp_screen.dart';
import 'package:hariya_education_institute/auth/screens/otp_verifying_notification_screen.dart';
import 'package:hariya_education_institute/auth/screens/user_information.dart';
import 'package:hariya_education_institute/common/widget/error.dart';
import 'package:hariya_education_institute/features/landing/screens/landing_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case LandingScreen.routeName:
      return MaterialPageRoute(builder: (context) => LandingScreen());
    case OTPScreen.routeName:
      final String verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(
                verificationId: verificationId,
              ));
    case OTPVerifying_notification_Screen.routeName:
      return MaterialPageRoute(
          builder: (context) => OTPVerifying_notification_Screen());
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => UserInformationScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: ErrorScreen(
            error: 'This page doesn\'t exit',
          ),
        ),
      );
  }
}
