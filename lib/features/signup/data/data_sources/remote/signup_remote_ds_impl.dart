import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_c9_str/core/api/api_manager.dart';
import 'package:ecommerce_c9_str/core/api/endpoints.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/signup/data/data_sources/remote/signup_remote_ds.dart';
import 'package:ecommerce_c9_str/features/signup/data/models/UserModel.dart';
import 'package:ecommerce_c9_str/features/signup/data/models/request_data.dart';

class SignUpRemoteDSImpl implements SignUpRemoteDS {
  ApiManager apiManager;

  SignUpRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, UserModel>> signUp(RequestData requestData) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.signup, body: requestData.toJson());

      if (response.statusCode != 200 || response.statusCode != 201) {
        return Left(RemoteFailures(response.data['message']));
      }
      UserModel userModel = UserModel.fromJson(response.data);

      return Right(userModel);
    } catch (e) {
      throw Exception();
    }
  }
}
