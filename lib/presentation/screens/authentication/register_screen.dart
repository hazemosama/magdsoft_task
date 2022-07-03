import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_cubit.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_states.dart';
import 'package:magdsoft_task/localization/applocale.dart';
import 'package:magdsoft_task/presentation/router/app_router.dart';
import 'package:magdsoft_task/presentation/screens/authentication/login_screen.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widget/defaultButton.dart';
import 'package:magdsoft_task/presentation/widget/defaultFormField.dart';
import 'package:magdsoft_task/presentation/widget/design.dart';
import 'package:magdsoft_task/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passController = TextEditingController();
  var cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            navigateAndFinish(context, LoginScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: design(
                child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      defaultFormField(
                        label: '${getLang(context, 'Full name')}',
                        controller: fullNameController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your Full Name';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      defaultFormField(
                        label: '${getLang(context, 'Email')}',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      defaultFormField(
                        label: '${getLang(context, 'Phone')}',
                        controller: phoneController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your Phone Number';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      defaultFormField(
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.isEmpty && value.length < 6) {
                            return 'password is too short';
                          }
                        },
                        label: '${getLang(context, 'Password')}',
                        suffix: AuthCubit.get(context).suffix,
                        isPassword: AuthCubit.get(context).isPassword,
                        suffixPressed: () {
                          AuthCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      defaultFormField(
                        controller: cPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'password is not match';
                          }
                        },
                        label: '${getLang(context, 'Confirm password')}',
                        suffix: AuthCubit.get(context).suffix,
                        isPassword: AuthCubit.get(context).isPassword,
                        suffixPressed: () {
                          AuthCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 106,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          defaultButton(
                            text: '${getLang(context, 'Register')}',
                            function: () {
                              AuthCubit.get(context).userRegister(
                                  name: fullNameController.text,
                                  email: emailController.text,
                                  password: cPasswordController.text,
                                  phone: phoneController.text);
                            },
                            background: AppColors.defaultColor,
                          ),
                          defaultButton(
                            text: '${getLang(context, 'Login')}',
                            function: () {
                              navigateTo(context: context, widget: LoginScreen());
                            },
                            background: AppColors.defaultColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
