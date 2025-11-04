import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/view/cardetail/car_detail_customize_screen.dart';
import 'package:lcv_ui_demo/widgets/app_text.dart';

class HomeCarView extends StatelessWidget {
  const HomeCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Assets.icons.home.icHomeCar.image(
            // width: double.infinity,
            // height: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailCustomizeScreen(),
                ),
              );
            },
            child: AppText("Vehicle Information"),
          ),
        ),
      ],
    );
  }
}
