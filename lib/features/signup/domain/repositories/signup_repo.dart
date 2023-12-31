import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';

import '../../data/models/request_data.dart';

abstract class SignUpRepo {
  Future<Either<Failures, UserEntity>> signUp(RequestData requestData);
}
