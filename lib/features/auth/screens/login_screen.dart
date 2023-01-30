import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hariya_education_institute/common/utils/utils.dart';
import 'package:hariya_education_institute/common/widget/custom_button.dart';
import 'package:hariya_education_institute/themes/app_theme.dart';

import '../../../themes/colors.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _code = "";
  String signature = "{{ app signature }}";
  bool indicator = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
  }

  void sendPhoneNumber() async {
    String phoneNumber = _phoneController.text.trim();
    setState(() {
      indicator = true;
    });

    if (phoneNumber.isNotEmpty) {
      if (phoneNumber.characters.length < 10) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          indicator = false;
        });
        showSnackBar(
            context: context,
            content: 'lreKdlr ksjerÈj wxlh we;=<;a lrkak',
            language: 1);
      } else {
        String phoneNumberWithCountryCode = "+94${phoneNumber.substring(1)}";

        ref.read(authControllerProvider).signInWithPhone(
              context,
              phoneNumberWithCountryCode,
            );
      }
    } else {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        indicator = false;
      });
      showSnackBar(
          context: context,
          content: 'lreKdlr ÿrl:k wxlh we;=<;a lrkak',
          language: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: SizedBox(
          width: size.width,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'ÿrl:k wxlh we;=,;a lrkak',
              style: TextStyle(
                  fontFamily: AppTheme.headFont, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.0,
            ),
            TextField(
              autofocus: true,
              controller: _phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "07XXXXXXXX",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                suffixIcon: suffixButton(),
                //   Container(
                // padding: EdgeInsets.only(right: 5.0),
                // width: 90.0,
                // child: CustomButton(
                //   text: 'yß',
                //   onpressed: sendPhoneNumber,
                //   language: 1,
                //),
                //),
              ),
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SizedBox(
              height: 5.0,
            ),
            const Text(
              'we;=,aùug fmr i;Hdmkh i|yd Tnf.a ÿrl:k wxlh wjYHhs',
              style: TextStyle(
                  fontFamily: AppTheme.headFont, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

// later
  Widget suffixButton() {
    if (indicator == false) {
      return Container(
        padding: EdgeInsets.only(right: 5.0),
        width: 90.0,
        child: CustomButton(
          text: 'yß',
          onpressed: sendPhoneNumber,
          language: 1,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(right: 5.0),
        width: 90.0,
        child: ElevatedButton(
          onPressed: () {},
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
        ),
      );
    }
  }
}
