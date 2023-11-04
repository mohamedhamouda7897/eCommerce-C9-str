import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';

abstract class LoginDomainRepo {
  Future<Either<Failures, UserEntity>> login(String email, String password);
}
