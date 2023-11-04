import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_c9_str/core/api/api_manager.dart';
import 'package:ecommerce_c9_str/core/error/failures.dart';
import 'package:ecommerce_c9_str/features/login/data/data_sources/remote/login_remote_ds.dart';
import 'package:ecommerce_c9_str/features/login/data/repositories/login_repo_impl.dart';
import 'package:ecommerce_c9_str/features/login/domain/repositories/login_domain_repo.dart';
import 'package:ecommerce_c9_str/features/login/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_str/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonClickEvent) {
        emit(state.copyWith(screenType: ScreenStatus.loading));

        ApiManager apiManager = ApiManager();
        LoginRemoteDS loginRemoteDS = LoginRemoteDSImpl(apiManager);
        LoginDomainRepo loginRepo = LoginRepoImpl(loginRemoteDS);
        LoginUseCase loginUseCase = LoginUseCase(loginRepo);

        var result = await loginUseCase.call("sra@gmail.com", "sama@123");

        result.fold((l) {
          emit(state.copyWith(screenType: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenType: ScreenStatus.successfully, userEntity: r));
        });
      }
    });
  }
}
