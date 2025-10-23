import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_gradients.dart';

class HomeControlStatusItem extends StatelessWidget {
  const HomeControlStatusItem({super.key, required this.item});
  final ControlStatusItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          !item.isHighlight
              ? null
              : BoxDecoration(
                color: Colors.black,
                border: Border(
                  bottom: BorderSide(color: Colors.white, width: 1.25),
                ),
              ),

      width: 40,
      height: 40,
      child: Stack(
        children: [
          if (item.isHighlight)
            Container(
              decoration: BoxDecoration(
                gradient: AppGradients.hometControlStatusOn,
              ),
            ),
          Center(child: item.item.onNormal()),
        ],
      ),
    );
  }
}

class ControlStatusItem {
  ControlStatus item;
  bool isHighlight;
  ControlStatusItem({required this.item, required this.isHighlight});
}

enum ControlStatus { light, door, window, roomlight, hazard }

extension InfoControlStatusExtension on ControlStatus {
  Image onNormal() {
    switch (this) {
      case ControlStatus.light:
        return Assets.icons.home.icHomeMenuLight.image();
      case ControlStatus.door:
        return Assets.icons.home.icHomeMenuDoor.image();
      case ControlStatus.window:
        return Assets.icons.home.icHomeMenuWindow.image();
      case ControlStatus.roomlight:
        return Assets.icons.home.icHomeMenuRoomlight.image();
      case ControlStatus.hazard:
        return Assets.icons.home.icHomeMenuHazard.image();
    }
  }
}
