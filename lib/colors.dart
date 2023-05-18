import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Color(0xff0077c8);
  static const Color cyan = Color(0xff00b0b9);
  static const Color green = Color(0xff3a913f);

  static  Gradient primaryGradient=const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.blue,
      AppColors.cyan,
      AppColors.green,
    ],
  );
}