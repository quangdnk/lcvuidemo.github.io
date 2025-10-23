import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/home/control/home_control_active_item.dart';
import 'package:lcv_ui_demo/view/home/control/home_control_active_view.dart';
import 'package:lcv_ui_demo/view/home/control/home_control_status_view.dart';

class HomeControlView extends StatelessWidget {
  const HomeControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    List<ControlAction> items = [
      ControlAction(isActived: false, item: CarActive.hazard),
      ControlAction(isActived: false, item: CarActive.ac),
      ControlAction(isActived: false, item: CarActive.horn),
    ];
    return SizedBox(
      child: Column(
        children: [
          HomeControlStatusView(),
          SizedBox(height: 12),
          HomeControlActiveView(items: items),
        ],
      ),
    );
  }
}
