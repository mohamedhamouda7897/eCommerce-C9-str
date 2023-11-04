import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/signup/data/data_sources/remote/signup_remote_ds.dart';
import 'package:ecommerce_c9_str/features/signup/data/models/request_data.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_str/features/signup/domain/repositories/signup_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  // SignUpLocalDS signUpLocalDS;
  SignUpRemoteDS signUpRemoteDS;

  SignUpRepoImpl(this.signUpRemoteDS);

  @override
  Future<Either<Failures, UserEntity>> signUp(RequestData requestData) =>
      signUpRemoteDS.signUp(requestData);
}
