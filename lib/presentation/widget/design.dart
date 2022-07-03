import 'package:flutter/material.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';

Widget design({
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
          top: 13,
          child: Image(
              image: AssetImage(
                'assets/images/logo.png',
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 270),
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
      ],
    );