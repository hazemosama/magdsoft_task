import 'package:magdsoft_task/data/models/account_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final AccountModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState(this.error);
}