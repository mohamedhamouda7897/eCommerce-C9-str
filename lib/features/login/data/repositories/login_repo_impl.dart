import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/login/data/data_sources/remote/login_remote_ds.dart';
import 'package:ecommerce_c9_str/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';

class LoginRepoImpl implements LoginDomainRepo {
  LoginRemoteDS loginRemoteDS;

  LoginRepoImpl(this.loginRemoteDS);

  @override
  Future<Either<Failures, UserEntity>> login(String email, String password) =>
      loginRemoteDS.login(email, password);
}
