import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_cubit.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_states.dart';
import 'package:magdsoft_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_task/localization/applocale.dart';
import 'package:magdsoft_task/presentation/router/app_router.dart';
import 'package:magdsoft_task/presentation/screens/authentication/register_screen.dart';
import 'package:magdsoft_task/presentation/screens/user/user_profile_screen.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widget/defaultButton.dart';
import 'package:magdsoft_task/presentation/widget/defaultFormField.dart';
import 'package:magdsoft_task/presentation/widget/design.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          navigateAndFinish(context, UserProfileScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
          body: Stack(
            children: [
              design(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 150,
                      ),
                      child: Column(
                        children: [
                          defaultFormField(
                            width: 286.0,
                            label: '${getLang(context, "Email")}',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return '${getLang(context, "Enter_Email")}';
                              }
                            },
                            prefix: Icons.email_outlined,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          defaultFormField(
                            width: 286.0,
                            controller: passController,
                            keyboardType: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return '${getLang(context, "Password_Short")}';
                              }
                            },
                            label: '${getLang(context, "Password")}',
                            prefix: Icons.lock_outline,
                            suffix: AuthCubit.get(context).suffix,
                            isPassword: AuthCubit.get(context).isPassword,
                            suffixPressed: () {
                              AuthCubit.get(context).changePasswordVisibility();
                            },
                          ),
                          const SizedBox(
                            height: 165,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              defaultButton(
                                text: '${getLang(context, "Register")}',
                                function: () {
                                  navigateTo(
                                      widget: RegisterScreen(),
                                      context: context);
                                },
                                background: AppColors.defaultColor,
                              ),
                              defaultButton(
                                text: '${getLang(context, "Login")}',
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passController.text,
                                    );
                                  }
                                },
                                background: AppColors.defaultColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 47,
                right: 21,
                child: defaultButton(
                  function: () {
                    GlobalCubit.get(context).changeAppLang();
                  },
                  text: '${getLang(context, 'lang')}',
                  height: 31,
                  background: Colors.white,
                  textColors: AppColors.defaultColor,
                  fontSize: 15,
                  width: 84,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
