part of 'login_bloc.dart';

@immutable
class LoginState {
  ScreenStatus? screenType;
  UserEntity? userEntity;
  Failures? failures;

  LoginState({this.screenType, this.userEntity, this.failures});

  LoginState copyWith(
      {ScreenStatus? screenType, UserEntity? userEntity, Failures? failures}) {
    return LoginState(
        userEntity: userEntity ?? this.userEntity,
        failures: failures ?? this.failures,
        screenType: screenType ?? this.screenType);
  }
}

class LoginInitial extends LoginState {
  LoginInitial() : super(screenType: ScreenStatus.init);
}
