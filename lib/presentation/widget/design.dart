import 'package:flutter/material.dart';
import 'package:magdsoft_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_task/localization/applocale.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';
import 'package:magdsoft_task/presentation/widget/defaultButton.dart';

Widget design(context,{
  required Widget child,
}) =>
    Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.defaultColor,
        ),
        const Positioned(
          left: 123,
          right: 123,
          top: 36,
          child: Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 195),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  50,
                ),
                topLeft: Radius.circular(
                  50,
                ),
              ),
            ),
            child: child,
          ),
        ),
        Positioned(
          top: 49,
          right: 21,
          child: defaultButton(
            function: () {
              GlobalCubit.get(context).changeAppLang();
            },
            text: '${getLang(context, 'lang')}',
            height: 31,
            background: Colors.white,
            textColor: AppColors.defaultColor,
            fontSize: 15,
            width: 84,
          ),
        ),
      ],
    );
