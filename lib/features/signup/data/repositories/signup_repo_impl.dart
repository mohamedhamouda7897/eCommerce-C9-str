import 'package:ecommerce_c9_str/features/signup/data/data_sources/local/signup_local_ds.dart';
import 'package:ecommerce_c9_str/features/signup/data/data_sources/remote/signup_remote_ds.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_str/features/signup/domain/repositories/signup_repo.dart';

import '../models/request_data.dart';

class SignUpRepoImpl implements SignUpRepo {
  // SignUpLocalDS signUpLocalDS;
  SignUpRemoteDS signUpRemoteDS;

  SignUpRepoImpl(this.signUpRemoteDS);

  @override
  Future<UserEntity> signUp(RequestData requestData) =>
      signUpRemoteDS.signUp(requestData);
}
