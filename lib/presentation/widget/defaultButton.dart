import 'package:flutter/material.dart';

Widget defaultButton({
  double? width,
  double? height,
  Color? background,
  bool? isUpperCase = true,
  required VoidCallback? function,
  required String text,
  Color? textColors = Colors.white,
  double? fontSize = 20,
}) =>
    SizedBox(
      width: width ?? 152,
      height: height ?? 55,
      child: Material(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: background,
        //HexColor("F23B3F"),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // Add This
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: textColors, fontSize: fontSize),
          ),
        ),
      ),
    );
