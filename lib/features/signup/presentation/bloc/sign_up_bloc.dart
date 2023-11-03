import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/signup/data/data_sources/local/signup_local_ds.dart';
import 'package:e_commerce/features/signup/data/data_sources/local/signup_local_ds_impl.dart';
import 'package:e_commerce/features/signup/data/data_sources/remote/signup_remote_ds.dart';
import 'package:e_commerce/features/signup/data/data_sources/remote/signup_remote_ds_impl.dart';
import 'package:e_commerce/features/signup/data/models/request_data.dart';
import 'package:e_commerce/features/signup/data/repositories/signup_repo_impl.dart';
import 'package:e_commerce/features/signup/domain/entities/UserEntity.dart';
import 'package:e_commerce/features/signup/domain/repositories/signup_repo.dart';
import 'package:e_commerce/features/signup/domain/use_cases/sign_up_uasecase.dart';
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

        SignUpRemoteDS signUpRemoteDS = SignUpRemoteDSImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(signUpRemoteDS);
        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);

        RequestData requestData = RequestData(
            name: "Sara",
            email: "sarahmedrageb@gmail.com",
            password: "123@Sara",
            rePassword: "123@Sara",
            phone: "01111111111");
        try {
          UserEntity value = await signUpUseCase.call(requestData);
          emit(state.copyWith(
              screenType: ScreenStatus.successfully, userEntity: value));
        } catch (e) {
          emit(state.copyWith(
              screenType: ScreenStatus.failures,
              failures: RemoteFailures(e.toString())));
        }
      }
    });
  }
}
