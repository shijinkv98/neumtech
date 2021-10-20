import 'package:dio/dio.dart';
import 'package:medfeed/helper/api_url_data.dart';

class APIService {
  static final APIService _singleton = new APIService._internal();
  String customerId;
  String phone;
  String name;
  factory APIService() {
    return _singleton;
  }

  APIService._internal() {
    _initilizeHeader();
  }

  Dio dio = new Dio();

  _initilizeHeader() {
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Authorization"] = "Bearer $token";

  }
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMjVlZjVmZTVmNWMzOTYxNDI4NDIzYyIsImlhdCI6MTYzMzcwNzA3OCwiZXhwIjoxNjM2Mjk5MDc4fQ.dvxArYOcy_JMdJtz-ypGhrP-zUAmUm8ml5pcs7ijpoY";

  updateHeader(String authToken) async {
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Authorization"] = "Bearer $token";
  }
   ///get home data//
  Future<Response> getHomeData() async {
    var url = APIClient.HOME;
    print("URL:::" + url + "authorization:::" "Bearer $token");
    Response response = await dio.get(url);
    // );
    print("RESPONSE:::" + response.data.toString());
    print(response.headers);
    return response;
  }
  Future<Response> getHealthData() async {
    var url = APIClient.HEALTH;
    print("URL:::" + url + "authorization:::" "Bearer $token");
    Response response = await dio.post(url);
    // );
    print("RESPONSE:::" + response.data.toString());
    print(response.headers);
    return response;
  }

}