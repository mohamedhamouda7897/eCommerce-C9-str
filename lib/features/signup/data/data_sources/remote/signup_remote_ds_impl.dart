import 'package:dio/dio.dart';
import 'package:ecommerce_c9_str/core/api/api_manager.dart';
import 'package:ecommerce_c9_str/core/api/endpoints.dart';
import 'package:ecommerce_c9_str/features/signup/data/data_sources/remote/signup_remote_ds.dart';
import 'package:ecommerce_c9_str/features/signup/data/models/UserModel.dart';

import '../../models/request_data.dart';

class SignUpRemoteDSImpl implements SignUpRemoteDS {
  ApiManager apiManager;

  SignUpRemoteDSImpl(this.apiManager);

  @override
  Future<UserModel> signUp(RequestData requestData) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.signup, body: requestData.toJson());

      UserModel userModel = UserModel.fromJson(response.data);

      print(userModel.message);
      return userModel;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}
