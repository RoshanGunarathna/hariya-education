import 'package:flutter/material.dart';

import 'package:hariya_education_institute/themes/app_theme.dart';

import '../../../common/widget/custom_button.dart';
import '../../../themes/colors.dart';
import '../../auth/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/landing-screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void nextScreen() {
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushNamed(context, LoginScreen.routeName);
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
                        padding: EdgeInsets.only(
                            left: 40, right: 30, top: 45, bottom: 20),
                        height: 415.0,
                        width: 350.0,
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 35.0),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 15.0),
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
                                  height: 80,
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
                                height: screenHeight / 6,
                              ),
                              Text(
                                'Read our Privacy Policy. Tap "Agree and continue" to Accept the Terms of Service.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: screenWidth * 0.75,
                                child: CustomButton(
                                  text: 'AGREE AND CONTINUE',
                                  onpressed: () {
                                    Navigator.pushNamed(
                                        context, LoginScreen.routeName);
                                  },
                                  language: 2,
                                ),
                              )
                            ],
                          )),
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
