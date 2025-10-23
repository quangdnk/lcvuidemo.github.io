import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/home/control/home_control_status_item.dart';

class HomeControlStatusView extends StatelessWidget {
  const HomeControlStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ControlStatusItem> items = [
      ControlStatusItem(isHighlight: false, item: ControlStatus.light),
      ControlStatusItem(isHighlight: true, item: ControlStatus.door),
      ControlStatusItem(isHighlight: false, item: ControlStatus.window),
      ControlStatusItem(isHighlight: true, item: ControlStatus.roomlight),
      ControlStatusItem(isHighlight: true, item: ControlStatus.hazard),
    ];
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(right: index < items.length - 1 ? 15 : 0),
            child: HomeControlStatusItem(item: item),
          );
        }),
      ),
    );
  }
}
