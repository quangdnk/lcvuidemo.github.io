import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_decorations.dart';
import 'package:lcv_ui_demo/themes/app_gradients.dart';

class HomeInformationFindcar extends StatelessWidget {
  const HomeInformationFindcar({super.key});

  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return Container(
      decoration: AppDecorations.boxWithBorder,
      child: Stack(
        children: [
          Assets.icons.home.icHomeFindcardBg.image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            decoration: BoxDecoration(gradient: AppGradients.styleOne),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            right: 20,
            top: 40,
            child: Assets.icons.home.icHomeFindcarLocation.image(),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              "Find My Car",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
