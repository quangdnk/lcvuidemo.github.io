import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';

class HomeFeatureCustomizeView extends StatelessWidget {
  const HomeFeatureCustomizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return Center(child: _container());
  }

  Widget _container() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        border: Border.all(color: "#3A3B3C".toColor(), width: 1),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ["#282C30".toColor(), "#101417".toColor()],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.home.icHomeFeatureEdit.image(width: 16, height: 16),
          Text("Customize Features", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
