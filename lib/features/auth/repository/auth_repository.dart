import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hariya_education_institute/common/repositories/common_firebase_storage_repository.dart';
import 'package:hariya_education_institute/common/utils/utils.dart';
import 'package:hariya_education_institute/models/user_model.dart';

import '../../home/screens/home_screen.dart';
import '../screens/otp_screen.dart';
import '../screens/otp_verifying_notification_screen.dart';
import '../screens/user_information.dart';

final authRepositoryProvider = Provider(
  ((ref) => AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance)),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({required this.auth, required this.firestore});

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: phoneNumber,
        verificationCompleted: ((PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);

          Navigator.pushNamed(
              context, OTPVerifying_notification_Screen.routeName);
        }),
        verificationFailed: ((e) {
          throw Exception(e.message);
        }),
        codeSent: ((String verificationId, int? resendToken) async {
          Navigator.pushNamed(context, OTPScreen.routeName,
              arguments: verificationId);
        }),
        codeAutoRetrievalTimeout: (String varificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!, language: 2);
    }
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);

      await auth.signInWithCredential(credential);

      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.message ==
          'The verification ID used to create the phone auth credential is invalid.') {
        showSnackBar(
            context: context,
            content: 'wxlh jerÈh¡ lreKdlr ksjerÈj we;=<;a lrkak¡',
            language: 1);
      }
      ;
      showSnackBar(context: context, content: e.message!, language: 2);
      print(e.message);
    }
  }

  void saveUserDataToFirebase({
    required String firstName,
    required String lastName,
    required String userName,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://roshanrn.tk/wp-content/uploads/2022/10/hariya_chatapp_dp.png';
      if (profilePic != null) {
        photoUrl = await ref
            .read(CommonFirebaseStorageRepositoryProvider)
            .storeFileFirebase(
              'profilePic/$uid',
              profilePic,
            );
        var user = UserModel(
            firstName: firstName,
            lastName: lastName,
            userName: userName,
            uid: uid,
            profilePic: photoUrl,
            isOnline: true,
            phoneNumber: auth.currentUser!.phoneNumber ?? auth.currentUser!.uid,
            groupId: []);
        await firestore.collection('users').doc(uid).set(user.toMap());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString(), language: 2);
    }
  }
}
