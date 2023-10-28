import 'package:dio/dio.dart';
import 'package:ecommerce_c9_str/core/api/endpoints.dart';
import 'package:ecommerce_c9_str/core/utils/constants.dart';

class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? data}) async {
    return dio.get(Constants.baseURl + endPoint, queryParameters: data);
  }

  Future<Response> postData(
      {required String endPoint, Map<String, dynamic>? body}) async {
    print(Constants.baseURl + endPoint);
    print(body);
    return dio.post(Constants.baseURl + endPoint, data: body);
  }
}
