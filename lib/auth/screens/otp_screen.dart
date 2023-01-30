import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hariya_education_institute/auth/controller/auth_controller.dart';
import 'package:hariya_education_institute/themes/app_theme.dart';
import 'package:hariya_education_institute/themes/colors.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;

  const OTPScreen({super.key, required this.verificationId});

  void varifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "ÿrl:khg ,enqKq wxlh we;=<;a lrkak",
              style: TextStyle(
                fontFamily: AppTheme.headFont,
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "flámKsúvhla f,i Tng ,eî we;s wxlh fuys i|yka lrkak¡",
              style: TextStyle(fontFamily: AppTheme.headFont),
            ),
          ),
          SizedBox(
            width: size.width * 0.5,
            child: TextField(
              inputFormatters: [LengthLimitingTextInputFormatter(6)],
              cursorWidth: 3,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              cursorColor: primaryColor,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '- - - - - -',
                hintStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                if (val.length == 6) {
                  varifyOTP(ref, context, val.trim());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
