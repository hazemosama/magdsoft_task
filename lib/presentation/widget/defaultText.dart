import 'package:flutter/material.dart';
import 'package:magdsoft_task/presentation/styles/colors.dart';

Widget defaultText({
  String? text,
  Color? color,
  double? size,
}) =>
    Text(
      '$text',
      style: TextStyle(
        color: color ?? AppColors.defaultColor,
        fontSize: size ?? 14.0,
      ),
    );
