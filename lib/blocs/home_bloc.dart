import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:neumtech/responses/home_response.dart';
import 'package:neumtech/utils/api_services.dart';
import 'package:neumtech/utils/app_utils.dart';
import 'package:neumtech/utils/alert_utils.dart';

class HomeBloc extends ChangeNotifier {
  bool isLoading = false;
  List<Data> listData = new List<Data>();

  getHomeData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getHomeData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            HomeResponse homeResponse = HomeResponse.fromJson(response.data);
            listData = homeResponse.data;
            notifyListeners();
          if (homeResponse.success == "true") {
          AlertUtils.showToast(homeResponse.success, context);
          } else if (homeResponse.success == 3) {
            print("NEED TO LOGIN HERE......");
          }else if (homeResponse.success == "success") {
            notifyListeners();
          }
        } else {
        AlertUtils.showToast("Failed", context);
        }
        });
      }
    });
  }
}