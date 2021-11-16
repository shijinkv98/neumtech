import 'dart:io';
import 'dart:math';
import 'package:connectivity/connectivity.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'dialog_utils.dart';

class AppUtils {
  static String generateRandomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    String randomKey = new String.fromCharCodes(codeUnits);
    return randomKey;
  }

  static Future<bool> isConnectedToInternet(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return true;
    } else {
      DialogUtils.showNoNetworkDialog(context);
      return false;
    }
  }

  static DateTime getDateFromString(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return dateTime;
    } catch (e) {
      print(e);
      return DateTime.now();
    }
  }


}
