import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/home/control/home_control_active_item.dart';

class HomeControlActiveView extends StatelessWidget {
  const HomeControlActiveView({super.key, required this.items});
  final List<ControlAction> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Padding(
              padding: EdgeInsets.only(
                right: index < items.length - 1 ? 15 : 0,
              ),
              child: _buildItem(item: item),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildItem({required ControlAction item}) {
    return Center(child: HomeControlActiveItem(item: item));
  }
}
