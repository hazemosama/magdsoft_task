import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_cubit.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_states.dart';
import 'package:magdsoft_task/data/models/account_model.dart';
import 'package:magdsoft_task/localization/applocale.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widget/defaultButton.dart';
import 'package:magdsoft_task/presentation/widget/defaultText.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);

    return BlocConsumer<AuthCubit, AuthStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: defaultText(
              text: "${getLang(context, 'User_Data')}",
              size: 30.0,
              color: AppColors.white,
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: AppColors.defaultColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConditionalBuilder(
                  condition: authCubit.loginModel != null,
                  builder: (context) => userInfo(authCubit.loginModel!, context),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Center(
                  child: defaultButton(
                    function: () {
                      authCubit.signOut(context);
                    },
                    text: '${getLang(context, 'Logout')}',
                    background: const Color(
                      0xffad002f,
                    ),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget userInfo(AccountModel model, context) => Padding(
        padding: const EdgeInsetsDirectional.only(top: 170.0),
        child: Column(
          children: [
            defaultText(
              text: '${getLang(context, 'Name')} : ${model.account[0].name}',
              size: 25.0,
            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
              text: '${getLang(context, 'Email')} : ${model.account[0].email}',
              size: 25.0,
            ),
            const SizedBox(
              height: 8,
            ),
            defaultText(
              text: '${getLang(context, 'Phone')} : ${model.account[0].phone}',
              size: 25.0,
            ),
            const SizedBox(
              height: 250.0,
            ),
          ],
        ),
      );
}
