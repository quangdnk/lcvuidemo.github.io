import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';

class AppGradients {
  static final styleOne = LinearGradient(
    colors: [AppColors.black3C.withValues(alpha: 0.3), AppColors.black34],
  );

  static final styleTwo = LinearGradient(
    colors: [AppColors.black28, AppColors.black10],
  );

  static final hometControlStatusOn = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      // Colors.white,
      Colors.white.withValues(alpha: 0),
      Colors.white.withValues(alpha: 0.5),
    ],
  );
  static final featueBackground = LinearGradient(
    colors: [AppColors.black25, AppColors.black30],
  );
}
