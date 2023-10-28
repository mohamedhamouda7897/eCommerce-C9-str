part of 'sign_up_bloc.dart';

enum ScreenStatus { loading, successfully, failures, init }

@immutable
class SignUpState {
  ScreenStatus? screenType;
  UserEntity? userEntity;
  Failures? failures;

  SignUpState({this.screenType, this.userEntity, this.failures});

  SignUpState copyWith(
      {ScreenStatus? screenType, UserEntity? userEntity, Failures? failures}) {
    return SignUpState(
        userEntity: userEntity ?? this.userEntity,
        failures: failures ?? this.failures,
        screenType: screenType ?? this.screenType);
  }
}

class SignUpInitial extends SignUpState {
  SignUpInitial() : super(screenType: ScreenStatus.init);
}
