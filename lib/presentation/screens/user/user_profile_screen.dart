import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_cubit.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_states.dart';
import 'package:magdsoft_task/data/models/account_model.dart';
import 'package:magdsoft_task/localization/applocale.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widget/defaultButton.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);

    return BlocConsumer<AuthCubit, AuthStates>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 67,
                  color: AppColors.defaultColor,
                  child: const Center(
                    child: Text(
                      "User Data",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                ConditionalBuilder(
                    condition: authCubit.loginModel != null,
                    builder: (context) =>
                        userInfo(authCubit.loginModel!,context),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator())),
                Center(
                  child: defaultButton(
                      function: () {
                        authCubit.signOut(context);
                      },
                      text: '${getLang(context, 'Logout')}',
                      background: const Color(0xffad002f),
                      fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget userInfo(AccountModel model,context) => Padding(
        padding: const EdgeInsetsDirectional.only(top: 211.0, start: 69),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${getLang(context, 'Name')} :',
                  style: const TextStyle(fontSize: 25, color: AppColors.defaultColor),
                ),
                Text(
                  ' ${model.account![0].name}',
                  style: const TextStyle(fontSize: 25, color: AppColors.defaultColor),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '${getLang(context, 'Email')} :',
                  style: const TextStyle(fontSize: 25, color: AppColors.defaultColor),
                ),
                Text(
                  ' ${model.account![0].email}',
                  style: const TextStyle(fontSize: 25, color: AppColors.defaultColor),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '${getLang(context, 'Phone')} :',
                  style: const TextStyle(fontSize: 25, color: AppColors.defaultColor),
                ),
                Text(
                  ' ${model.account![0].phone}',
                  style: const TextStyle(fontSize: 25, color: AppColors.defaultColor),
                ),
              ],
            ),
            const SizedBox(
              height: 360,
            ),
          ],
        ),
      );
}
