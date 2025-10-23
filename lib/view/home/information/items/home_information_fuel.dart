import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/themes/app_decorations.dart';
import 'package:lcv_ui_demo/widgets/app_animated_bar.dart';

class HomeInformationFuel extends StatelessWidget {
  const HomeInformationFuel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: AppDecorations.boxWithBorder,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [_header(), SizedBox(height: 6), _fuel(), _infomation()],
          ),
          _distanceInfomation(),
        ],
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "E",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Assets.icons.home.icHomeFuel.image(),
          Text(
            "F",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _fuel() {
    return AppAnimatedBar(progress: 60);
  }

  Widget _infomation() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("60%", style: TextStyle(color: Colors.white)),
          SizedBox(width: 8),
          Container(width: 2, height: 11, color: AppColors.black57),
          SizedBox(width: 8),
          Text("550km", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _distanceInfomation() {
    return Column(
      children: [
        Text("Kilometers driven", style: TextStyle(color: AppColors.gray80)),
        Text(
          "999.999",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
