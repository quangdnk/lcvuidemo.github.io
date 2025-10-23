import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';

class HomeHeaderTitleView extends StatelessWidget {
  const HomeHeaderTitleView({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: "#434343".toColor(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 11, height: 1.0),
            ),
            SizedBox(width: 5),
            Assets.icons.home.icHomeDropdown.image(height: 16, width: 16),
          ],
        ),
      ),
    );
  }
}
