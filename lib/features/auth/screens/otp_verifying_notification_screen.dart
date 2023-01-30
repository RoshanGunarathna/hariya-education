import 'package:flutter/material.dart';

import 'user_information.dart';

class OTPVerifying_notification_Screen extends StatefulWidget {
  static const String routeName = '/otp-verification-screen';
  const OTPVerifying_notification_Screen({super.key});

  @override
  State<OTPVerifying_notification_Screen> createState() =>
      _OTPVerifying_notification_ScreenState();
}

class _OTPVerifying_notification_ScreenState
    extends State<OTPVerifying_notification_Screen> {
  void waitingTimer() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    waitingTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator.adaptive(),
            SizedBox(
              height: 10,
            ),
            Text('Verifying')
          ],
        ),
      ),
    );
  }
}
