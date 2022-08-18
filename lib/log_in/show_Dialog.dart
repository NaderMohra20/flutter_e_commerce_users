import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppRouter.dart';

class CustemDialog {
  static showdialog(String title) {
    return showDialog(
        context: AppRouter.navkey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: const Text("No user found for that email."),
            actions: [
              TextButton(
                  onPressed: () {
                    AppRouter.popRoute();
                  },
                  child: const Text("ÖK"))
            ],
          );
        });
  }
}
