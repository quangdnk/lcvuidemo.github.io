import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/view/home/home_header_title_view.dart';

class HomeHeaderMainView extends StatelessWidget {
  const HomeHeaderMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return Column(
      children: [
        Container(height: 30),
        SizedBox(
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_leftMenu(), _middle(), _rightBar()],
          ),
        ),
      ],
    );
  }

  Widget _leftMenu() {
    return SizedBox(
      child: IconButton(
        onPressed: () => {},
        icon: Assets.icons.bar.icBarMenu.image(),
      ),
    );
  }

  Widget _rightBar() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 48,
          height: 48,
          child: Center(child: Assets.icons.bar.icBarNotification.image()),
        ),
      ),
    );
  }

  Widget _middle() {
    return HomeHeaderTitleView(title: "D-Max 2024");
  }
}
