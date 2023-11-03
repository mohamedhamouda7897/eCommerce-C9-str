import 'package:e_commerce/features/signup/domain/entities/UserEntity.dart';

import '../../data/models/request_data.dart';

abstract class SignUpRepo {
  Future<UserEntity> signUp(RequestData requestData);
}
