import 'package:flutter/material.dart';

Widget defaultButton({
  double? width,
  double? height,
  Color? background,
  bool isUpperCase = true,
  required VoidCallback? function,
  required String text,
  Color? textColor,
  double? fontSize,
}) =>
    SizedBox(
      width: width ?? 152,
      height: height ?? 55,
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: background,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // Add This
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 20,
            ),
          ),
        ),
      ),
    );
