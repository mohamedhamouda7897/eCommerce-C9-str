import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';

class LoginUseCase {
  LoginDomainRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<Failures, UserEntity>> call(String email, String password) =>
      loginRepo.login(email, password);
}
