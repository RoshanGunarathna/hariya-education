import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hariya_education_institute/themes/app_theme.dart';
import 'package:hariya_education_institute/themes/colors.dart';

import '../../common/widget/custom_button.dart';

class UserInformationScreenTest extends StatefulWidget {
  static const String routeName = '/UserInformation';
  const UserInformationScreenTest({super.key});

  @override
  State<UserInformationScreenTest> createState() =>
      _UserInformationScreenTestState();
}

class _UserInformationScreenTestState extends State<UserInformationScreenTest> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;

  Color firstElementColor = primaryColor;
  Color secondElementColor = Colors.transparent;
  Color thirdElementColor = Colors.transparent;
  Color firstCloseButtonColor = primaryColor;
  Color secondCloseButtonColor = Colors.transparent;
  Color thirdCloseButtonColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/splash_screen_images/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: size.height * 0.1,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            radius: size.height * 0.09,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/images/dp_avatar.png',
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Form(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/splash_screen_images/logo_background.png'),
                              fit: BoxFit.fill),
                        ),
                        padding: EdgeInsets.only(
                            left: 40.0, right: 40, bottom: 45, top: 27),
                        width: size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            //...

                            Stack(
                              children: [
                                Column(
                                  children: [
                                    userNameHeader(
                                        size: size,
                                        Content: 'wks;a whg Tnj fmkaúhhq;= ku',
                                        headerBackgroundColor:
                                            firstElementColor),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    userNameTextField(
                                      size: size,
                                      controller: controller1,
                                      hintText: 'HARIYA EDUCATION INSTITUTE',
                                      focusNode: focusNode1,
                                      whatNodeRun: 1,
                                      inputTextLimit: 25,
                                    ),
                                  ],
                                ),
                                userNameTextCleanButton(
                                  size: size,
                                  controller: controller1,
                                  buttonColor: firstCloseButtonColor,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            //....................
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    userNameHeader(
                                        size: size,
                                        Content: 'Tfí kfuys m,uq ku',
                                        headerBackgroundColor:
                                            secondElementColor),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      child: userNameTextField(
                                        size: size,
                                        controller: controller2,
                                        hintText: "ROSHAN",
                                        focusNode: focusNode2,
                                        whatNodeRun: 2,
                                        inputTextLimit: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                // userNameTextCleanButton(
                                //   size: size,
                                //   controller: controller2,
                                //   buttonColor: secondCloseButtonColor,
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    userNameHeader(
                                        size: size,
                                        Content: 'Tfí kfuys wjika ku',
                                        headerBackgroundColor:
                                            thirdElementColor),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      child: userNameTextField(
                                        size: size,
                                        controller: controller3,
                                        inputTextLimit: 15,
                                        hintText: "GUNARATHNA",
                                        focusNode: focusNode3,
                                        whatNodeRun: 3,
                                      ),
                                    ),
                                  ],
                                ),
                                // userNameTextCleanButton(
                                //   size: size,
                                //   controller: controller3,
                                //   buttonColor: thirdCloseButtonColor,
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.03,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.3),
                      child: CustomButton(
                        text: 'yß',
                        onpressed: () {},
                        language: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//Display Picture
  Widget circleAvatar(Size size) {
    return CircleAvatar(
      radius: size.height * 0.1,
      backgroundColor: Colors.grey,
      child: CircleAvatar(
        radius: size.height * 0.09,
        child: ClipRRect(
          child: Image.asset(
            'assets/images/dp_avatar.png',
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  //Username header

  Widget userNameHeader({
    required Size size,
    required String Content,
    required Color headerBackgroundColor,
  }) {
    print('userNameHeader size : ${size.height} ** ${size.width}');
    return Container(
      alignment: Alignment.centerLeft,
      height: size.height * 0.028,
      width: double.infinity,
      child: FittedBox(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8.0),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: headerBackgroundColor),
            ),
            Text(Content,
                style: TextStyle(
                  fontFamily: AppTheme.headFont,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
  //Username textField

  Widget userNameTextField({
    required String hintText,
    required FocusNode focusNode,
    required int whatNodeRun,
    required int inputTextLimit,
    required TextEditingController controller,
    required Size size,
  }) {
    return GestureDetector(
      onTap: () {
        var onColor = primaryColor;
        var offColor = Colors.transparent;
        var buttonOnColor = primaryColor;
        var transparent = Colors.transparent;

        switch (whatNodeRun) {
          case 1:
            if (controller2.text.isEmpty && controller3.text.isEmpty ||
                whatNodeRun == 1) {
              setState(() {
                firstElementColor = onColor;
                secondElementColor = offColor;
                thirdElementColor = offColor;
                firstCloseButtonColor = buttonOnColor;
                secondCloseButtonColor = offColor;
                thirdCloseButtonColor = offColor;
              });
            }

            if (controller2.text.isNotEmpty) {
              setState(() {
                secondElementColor = onColor;
                secondCloseButtonColor = onColor;
              });
            }

            if (controller3.text.isNotEmpty) {
              setState(() {
                thirdElementColor = onColor;
                thirdCloseButtonColor = onColor;
              });
            }

            break;
          case 2:
            if (controller1.text.isEmpty && controller3.text.isEmpty ||
                whatNodeRun == 2) {
              setState(() {
                secondElementColor = onColor;
                firstElementColor = offColor;
                thirdElementColor = offColor;
                secondCloseButtonColor = buttonOnColor;
                firstCloseButtonColor = offColor;
                thirdCloseButtonColor = offColor;
              });
            }
            if (controller1.text.isNotEmpty) {
              setState(() {
                firstElementColor = onColor;
                firstCloseButtonColor = onColor;
              });
            }

            if (controller3.text.isNotEmpty) {
              setState(() {
                thirdElementColor = onColor;
                thirdCloseButtonColor = onColor;
              });
            }

            break;
          case 3:
            if (controller1.text.isEmpty && controller2.text.isEmpty ||
                whatNodeRun == 3) {
              setState(() {
                secondElementColor = offColor;
                firstElementColor = offColor;
                thirdElementColor = onColor;
                secondCloseButtonColor = offColor;
                firstCloseButtonColor = offColor;
                thirdCloseButtonColor = buttonOnColor;
              });
            }
            if (controller1.text.isNotEmpty) {
              setState(() {
                firstElementColor = onColor;
                firstCloseButtonColor = onColor;
              });
            }

            if (controller2.text.isNotEmpty) {
              setState(() {
                secondElementColor = onColor;
                secondCloseButtonColor = onColor;
              });
            }

            break;
          default:
            setState(() {
              firstElementColor = primaryColor;
              secondElementColor = offColor;
              thirdElementColor = offColor;
              firstCloseButtonColor = primaryColor;
              secondCloseButtonColor = offColor;
              thirdCloseButtonColor = offColor;
            });
        }
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            IgnorePointer(
              child: TextFormField(
                focusNode: focusNode,
                controller: controller,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(inputTextLimit)
                ],
                style: TextStyle(fontSize: 18.0),
                cursorColor: Colors.black,
                cursorHeight: 25.0,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  focusedBorder: AppTheme.focusedBorder(),
                  enabledBorder: AppTheme.enabledBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Username text clean button
  Widget userNameTextCleanButton({
    required TextEditingController controller,
    required Color buttonColor,
    required Size size,
  }) {
    print('UserNameTextCleanButton size ${size.height} ** ${size.width}');
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(top: size.height * 0.046),
      child: SizedBox(
        child: IconButton(
          onPressed: () {
            setState(() {
              controller.text = '';
            });
          },
          icon: Icon(
            Icons.close_rounded,
            color: buttonColor,
          ),
        ),
      ),
    );
  }
}
