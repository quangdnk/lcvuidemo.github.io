import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';

class HomeCarView extends StatelessWidget {
  const HomeCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Assets.icons.home.icHomeCar.image(
        // width: double.infinity,
        // height: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
