import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';

class HomeFeatureHeaderView extends StatelessWidget {
  const HomeFeatureHeaderView({super.key, required this.featureTap});
  final VoidCallback featureTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        height: 40,
        child: GestureDetector(
          onTap: () {
            featureTap();
          },
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Features", style: TextStyle(color: Colors.white)),
                Assets.icons.home.icHomeFeatureChevronup.image(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
