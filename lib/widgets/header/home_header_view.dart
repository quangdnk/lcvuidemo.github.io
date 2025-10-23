import 'package:flutter/material.dart';

import 'package:lcv_ui_demo/gen/assets.gen.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Assets.icons.commons.icBack.image(),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: Assets.icons.commons.icHome.image(),
          ),
        ],
      ),
    );
  }
}
