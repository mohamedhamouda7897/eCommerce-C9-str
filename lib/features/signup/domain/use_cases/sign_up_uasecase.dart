import 'package:e_commerce/features/signup/domain/entities/UserEntity.dart';

import '../../data/models/request_data.dart';
import '../repositories/signup_repo.dart';

class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<UserEntity> call(RequestData requestData) =>
      signUpRepo.signUp(requestData);
}
