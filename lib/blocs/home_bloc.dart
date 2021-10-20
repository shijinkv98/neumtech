import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:medfeed/responses/health_response.dart';
import 'package:medfeed/responses/home_response.dart';
import 'package:medfeed/utils/api_services.dart';
import 'package:medfeed/utils/app_utils.dart';
import 'package:medfeed/helper/constants.dart';
import 'package:medfeed/utils/alert_utils.dart';

class HomeBloc extends ChangeNotifier {
  bool isLoading = false;
  List<Category> category = new List<Category>();
  List<Banners> banner = new List<Banners>();
  List<HealthData> healthData = new List<HealthData>();
  List<Articles> article = new List<Articles>();
  Data dataHome;
  getHomeData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getHomeData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            HomeResponse homeResponse =
            HomeResponse.fromJson(response.data);
            dataHome =homeResponse.data;
            category = homeResponse.data.category;
            banner = homeResponse.data.banner;
            article = homeResponse.data.articles;
            notifyListeners();
          if (homeResponse.message == "success") {
          AlertUtils.showToast(homeResponse.message, context);
          } else if (homeResponse.message == 3) {
            print("NEED TO LOGIN HERE......");
          }else if (homeResponse.message == "success") {
            category = homeResponse.data.category;
            banner = homeResponse.data.banner;
            dataHome =homeResponse.data;
            notifyListeners();
          }
        } else {
        AlertUtils.showToast("Login Failed", context);
        }
        });
      }
    });
  }

  getHealthData(BuildContext context)  {
    AppUtils.isConnectedToInternet(context).then((isConnected) {
      if (isConnected) {
        isLoading = true;
        notifyListeners();
        APIService().getHealthData().then((response) {
          isLoading = false;
          notifyListeners();
          if (response.statusCode == 200){
            HealthResponse healthResponse =
            HealthResponse.fromJson(response.data);
            healthData = healthResponse.data;
            notifyListeners();

          if (healthResponse.message == "success") {
          AlertUtils.showToast(healthResponse.message, context);
          } else if (healthResponse.message == 3) {
            print("NEED TO LOGIN HERE......");
          }else if (healthResponse.message == "success") {
            healthData = healthResponse.data;
            notifyListeners();
          }
        } else {
        AlertUtils.showToast("Login Failed", context);
        }
        });
      }
    });
  }
}