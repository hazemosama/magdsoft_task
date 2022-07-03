import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_states.dart';
import 'package:magdsoft_task/constants/end_points.dart';
import 'package:magdsoft_task/data/models/account_model.dart';
import 'package:magdsoft_task/data/models/regisrer_model.dart';
import 'package:magdsoft_task/data/remote/dio_helper.dart';
import 'package:magdsoft_task/presentation/router/app_router.dart';
import 'package:magdsoft_task/presentation/screens/authentication/login_screen.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: register,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  AccountModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: login,
      body: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = AccountModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  void signOut(context) {
    navigateAndFinish(
      context,
      LoginScreen(),
    );
  }

  IconData suffix = Icons.visibility_off;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
