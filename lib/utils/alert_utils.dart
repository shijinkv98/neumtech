import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertUtils {
  static showToast(String msg, BuildContext context) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}