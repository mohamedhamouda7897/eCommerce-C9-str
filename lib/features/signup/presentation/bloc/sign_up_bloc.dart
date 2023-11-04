import 'package:ecommerce_c9_str/core/api/api_manager.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/signup/data/data_sources/remote/signup_remote_ds.dart';
import 'package:ecommerce_c9_str/features/signup/data/data_sources/remote/signup_remote_ds_impl.dart';
import 'package:ecommerce_c9_str/features/signup/data/models/request_data.dart';
import 'package:ecommerce_c9_str/features/signup/data/repositories/signup_repo_impl.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_str/features/signup/domain/repositories/signup_repo.dart';
import 'package:ecommerce_c9_str/features/signup/domain/use_cases/sign_up_uasecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static SignUpBloc get(context) => BlocProvider.of(context);

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpButtonEvent) {
        emit(state.copyWith(screenType: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        RequestData requestData = RequestData(
            name: "Sara",
            email: "sarahmedrageb@gmail.com",
            password: "123@Sara",
            rePassword: "123@Sara",
            phone: "01111111111");
        SignUpRemoteDS signUpRemoteDS = SignUpRemoteDSImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(signUpRemoteDS);

        var value = await SignUpUseCase(signUpRepo)(requestData);

        value.fold((l) {
          emit(state.copyWith(screenType: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenType: ScreenStatus.successfully, userEntity: r));
        });
      }
    });
  }
}
