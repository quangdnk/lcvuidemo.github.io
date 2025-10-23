import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/themes/app_decorations.dart';

class HomeInformationRemote extends StatelessWidget {
  const HomeInformationRemote({super.key, required this.status});
  final InfoRemoteStatus status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 15),
      decoration: AppDecorations.boxWithBorder,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_title(), _titleStatus(), _iconStatus()],
      ),
    );
  }

  Widget _title() {
    return SizedBox(
      width: 130,
      child: Text(
        "Remote Confirmation",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _titleStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.backgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.title(),
        style: TextStyle(
          color: status.textColor(),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _iconStatus() {
    return SizedBox(width: 40, height: 40, child: status.backgroundImage());
  }
}

enum InfoRemoteStatus { good, nogood }

extension InfoRemoteStatusExtension on InfoRemoteStatus {
  String title() {
    switch (this) {
      case InfoRemoteStatus.good:
        return "All Good";
      case InfoRemoteStatus.nogood:
        return "Need Check";
    }
  }

  Color textColor() {
    switch (this) {
      case InfoRemoteStatus.good:
        return AppColors.green01;
      case InfoRemoteStatus.nogood:
        return AppColors.yellowFF;
    }
  }

  Color backgroundColor() {
    switch (this) {
      case InfoRemoteStatus.good:
        return AppColors.blue10;
      case InfoRemoteStatus.nogood:
        return AppColors.yellow4B;
    }
  }

  Image backgroundImage() {
    switch (this) {
      case InfoRemoteStatus.good:
        return Assets.icons.home.icHomeRemoteCarGood.image(
          fit: BoxFit.fitHeight,
        );
      case InfoRemoteStatus.nogood:
        return Assets.icons.home.icHomeRemoteCarCheck.image(
          fit: BoxFit.fitHeight,
        );
    }
  }
}
