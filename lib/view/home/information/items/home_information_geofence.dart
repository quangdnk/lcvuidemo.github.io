import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_decorations.dart';
import 'package:lcv_ui_demo/themes/app_gradients.dart';

class HomeInformationGeofence extends StatelessWidget {
  const HomeInformationGeofence({super.key});

  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return Container(
      decoration: AppDecorations.boxWithBorder,
      child: Stack(
        children: [
          Assets.icons.home.icHomeGeofenceBg.image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            decoration: BoxDecoration(gradient: AppGradients.styleOne),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(child: Assets.icons.home.icHomeGeofenceLocation.image()),
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
