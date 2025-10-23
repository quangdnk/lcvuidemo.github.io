import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';

class HomeControlActiveItem extends StatelessWidget {
  const HomeControlActiveItem({super.key, required this.item});
  final ControlAction item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: "#3A3B3C".toColor()),
        borderRadius: BorderRadius.circular(1),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ["#252627".toColor(), "#303132".toColor()],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 24, height: 24, child: item.item.iconUnActive()),
            Text(item.item.title(), style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class ControlAction {
  CarActive item;
  bool isActived;
  ControlAction({required this.isActived, required this.item});
}

enum CarActive { hazard, ac, horn }

extension CarActiveExtension on CarActive {
  String title() {
    switch (this) {
      case CarActive.hazard:
        return "Hazard";
      case CarActive.ac:
        return "A/C On";
      case CarActive.horn:
        return "Horn";
    }
  }

  Image iconUnActive() {
    switch (this) {
      case CarActive.hazard:
        return Assets.icons.home.icHomeActionHazard.image();
      case CarActive.ac:
        return Assets.icons.home.icHomeActionFan.image();
      case CarActive.horn:
        return Assets.icons.home.icHomeActionHorn.image();
    }
  }
}
