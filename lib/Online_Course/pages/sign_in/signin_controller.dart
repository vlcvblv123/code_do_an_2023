import 'package:CodeGenius/Online_Course/common/entities/entities.dart';
import 'package:CodeGenius/Online_Course/common/values/constant.dart';
import 'package:CodeGenius/Online_Course/common/widgets/flutter_toast.dart';
import 'package:CodeGenius/Online_Course/pages/sign_in/bloc/signin_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../common/apis/user_api.dart';
import '../../global.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? emali = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            print("${photoUrl}");
            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = emali;
            loginRequestEntity.open_id = id;
            //ty 1 means email login
            loginRequestEntity.type = 1;

            print("user exist");
            asyncPostAllData(loginRequestEntity);
            //Global.storageService
              //  .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            //Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            toastInfo(msg: "Currently you are not user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email.");
            return;
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "Wrong password provided for that user.");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email format is wrong");
            return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
   EasyLoading.show(
     indicator: const CircularProgressIndicator(),
     maskType: EasyLoadingMaskType.clear,
     dismissOnTap: true
   );
   var result = await UserAPI.login(params:loginRequestEntity);
  }
}
