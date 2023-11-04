import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/signup/data/models/UserModel.dart';

import '../../models/request_data.dart';

abstract class SignUpRemoteDS {
  Future<Either<Failures, UserModel>> signUp(RequestData requestData);
}
