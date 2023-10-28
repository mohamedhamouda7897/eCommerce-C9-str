import 'package:ecommerce_c9_str/features/signup/data/models/UserModel.dart';

import '../../models/request_data.dart';

abstract class SignUpRemoteDS {
  Future<UserModel> signUp(RequestData requestData);
}
