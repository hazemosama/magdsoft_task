import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';

AppBarTheme appBarTheme = const AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: AppColors.defaultColor,
    systemNavigationBarColor: AppColors.defaultColor,
  ),
);

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.grey,
  fontFamily: 'SegoeUI',
  appBarTheme: appBarTheme,
);