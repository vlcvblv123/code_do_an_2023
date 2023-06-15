import 'package:CodeGenius/Online_Course/common/values/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CodeGenius/Online_Course/common/widgets/flutter_toast.dart';
import 'package:CodeGenius/Online_Course/pages/register/bloc/register_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "password can not be empty");
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Re-Password name can not be empty");
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "${AppConstants.SERVER_API_URL}uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: "An email has been sent your registered email. To activate it please check your email box and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "The email id is invalid ");
      }
    }
  }
}
