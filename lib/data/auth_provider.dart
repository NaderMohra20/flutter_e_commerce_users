import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppRouter.dart';
import 'package:flutter_application_4/data/authhelper.dart';
import 'package:flutter_application_4/home_screen.dart';
import 'package:flutter_application_4/log_in/sign_in_view.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> signupKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  nullValiadation(String? v) {
    if (v == null || v.isEmpty) {
      return "هذا الحقل مطلوب";
    }
  }

  emailValiadation(String value) {
    if (!isEmail(value)) {
      return "صيغة ايميل خاطئة";
    }
  }

  passwordValiadation(String value) {
    if (value.length < 6) {
      return "يجب ان تكون كلمة المرور من 6 خانات على الاقل ";
    }
  }

  signIn() async {
    if (loginKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signIn(emailController.text, passwordController.text);
      if (credential != null) {
        AppRouter.NavigateToWidgetReplacement(HomeScreen());
      }
    }
  }

  signup() async {
    if (signupKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signUp(emailController.text, passwordController.text);
      if (credential != null) {
        AppRouter.NavigateToWidgetReplacement(SignInView());
      }
    }
  }

  // checkUser() {
  //   AuthHelper.authHelper.checkUser();
  // }

  signOut() {
    AuthHelper.authHelper.signUot();
  }

  forgetPassword() {
    AuthHelper.authHelper.forgetpassword("naderkamal637@gamail.com");
  }
}
