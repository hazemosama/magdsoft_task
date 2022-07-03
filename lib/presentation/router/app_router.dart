import 'package:flutter/material.dart';

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void navigateTo({required widget, required context}) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
