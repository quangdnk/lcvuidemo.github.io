import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';

class PickerHeaderView extends StatelessWidget {
  const PickerHeaderView({super.key, required this.title, required this.save});
  final VoidCallback save;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_closeButton(context), _title(), _saveButton()],
    );
  }

  Widget _closeButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.black3C,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Assets.icons.commons.icClose.image(),
      ),
    );
  }

  Widget _title() {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _saveButton() {
    return GestureDetector(
      onTap: save,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          "Save",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
        ),
      ),
    );
  }
}
