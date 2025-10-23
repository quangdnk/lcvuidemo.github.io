import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';

class PickerHeaderView extends StatelessWidget {
  const PickerHeaderView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_closeButton(), _title(), _saveButton()],
    );
  }

  Widget _closeButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black3C,
        borderRadius: BorderRadius.circular(2),
      ),

      child: Assets.icons.commons.icClose.image(),
    );
  }

  Widget _title() {
    return Text(title, style: TextStyle(color: Colors.white));
  }

  Widget _saveButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text("Save"),
    );
  }
}
