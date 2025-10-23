import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/themes/app_borders.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';

class AppDecorations {
  static final BoxDecoration boxWithBorder = BoxDecoration(
    color: AppColors.border,
    borderRadius: AppBorders.defaultRadius,
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.black25, AppColors.black30],
    ),
  );
}
