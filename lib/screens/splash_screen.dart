import 'package:flutter/material.dart';
import 'package:hariya_education_institute/features/landing/screens/landing_screen.dart';
import 'package:hariya_education_institute/themes/app_theme.dart';

import '../themes/colors.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextScreen();
  }

  void nextScreen() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, LandingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              child: Image.asset(
                'assets/images/splash_screen_images/background_image_2.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.8),
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              child: SingleChildScrollView(
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 35.0),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 15.0),
                              child: Image.asset(
                                "assets/images/hariya_sign_png.png",
                                alignment: Alignment.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Image.asset(
                                "assets/images/hariya_text_png.png",
                                alignment: Alignment.center,
                                height: 90,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "wOHdmk wdh;kh",
                              style: AppTheme.sinhalaTextStyle(context),
                            ),
                            SizedBox(
                              height: screenHeight / 8,
                            ),
                            Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
