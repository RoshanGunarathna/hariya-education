import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hariya_education_institute/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository, required this.ref});

  void signInWithPhone(
    BuildContext context,
    String phoneNumber,
  ) {
    authRepository.signInWithPhone(
      context,
      phoneNumber,
    );
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void saveUserDataToFirebase(
      {required BuildContext context,
      required String firstName,
      required File? profilePic,
      required String lastName,
      required String userName}) {
    authRepository.saveUserDataToFirebase(
        userName: userName,
        lastName: lastName,
        firstName: firstName,
        profilePic: profilePic,
        ref: ref,
        context: context);
  }
}
