import 'package:dio/dio.dart';
import 'package:neumtech/helper/api_url_data.dart';

class APIService {
  static final APIService _singleton = new APIService._internal();

  factory APIService() {
    return _singleton;
  }

  APIService._internal() {
    _initilizeHeader();
  }

  Dio dio = new Dio();

  _initilizeHeader() {
    dio.options.headers["Content-Type"] = "application/json";

  }

  updateHeader(String authToken) async {
    dio.options.headers["Content-Type"] = "application/json";
  }
   ///get home data//
  Future<Response> getHomeData() async {
      var url = APIClient.HOME;
      print("URL:::" + url);
      Response response = await dio.get(url);
      print("RESPONSE:::" + response.data.toString());
      return response;
    }

}