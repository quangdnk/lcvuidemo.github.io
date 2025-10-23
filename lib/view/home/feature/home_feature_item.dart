import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';

class HomeFeatureItem extends StatelessWidget {
  const HomeFeatureItem({super.key, required this.item, required this.clicked});
  final FeatureItem item;
  final ValueChanged<FeatureItem> clicked;
  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return GestureDetector(
      onTap: () {
        clicked(item);
      },
      child: Column(
        children: [_iconConfig(), SizedBox(height: 5), _titleCongig()],
      ),
    );
  }

  Widget _iconConfig() {
    return Container(
      decoration: BoxDecoration(
        color: "#3C3C3C".toColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      width: 48,
      height: 48,
      child: item.iconImage(),
    );
  }

  Widget _titleCongig() {
    return Text(
      item.title(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

enum FeatureItem {
  vehicleDiagnostic,
  climateControl,
  serviceInfomation,
  driveDiagnostic,
  myCarLog,
  softwareUpdate,
  geofence,
  findMyCar,
  remoteConfirmation,
}

extension FeatureItemExtension on FeatureItem {
  Image iconImage() {
    switch (this) {
      case FeatureItem.vehicleDiagnostic:
        return Assets.icons.home.icHomeFeatureVehiclediagnostic.image();
      case FeatureItem.climateControl:
        return Assets.icons.home.icHomeFeatureClimatecontrol.image();
      case FeatureItem.serviceInfomation:
        return Assets.icons.home.icHomeFeatureServiceinformation.image();
      case FeatureItem.driveDiagnostic:
        return Assets.icons.home.icHomeFeatureDriverassessment.image();
      case FeatureItem.myCarLog:
        return Assets.icons.home.icHomeFeatureMycarlog.image();
      case FeatureItem.softwareUpdate:
        return Assets.icons.home.icHomeFeatureSoftwareupdate.image();
      case FeatureItem.geofence:
        return Assets.icons.home.icHomeFeatureGeofence.image();
      case FeatureItem.findMyCar:
        return Assets.icons.home.icHomeFeatureFindmycar.image();
      case FeatureItem.remoteConfirmation:
        return Assets.icons.home.icHomeFeatureRemotecontrol.image();
    }
  }

  String title() {
    switch (this) {
      case FeatureItem.vehicleDiagnostic:
        return "Vehicle Diagnostic";
      case FeatureItem.climateControl:
        return "Climate Control";
      case FeatureItem.serviceInfomation:
        return "Service Information";
      case FeatureItem.driveDiagnostic:
        return "Drive Diagnostic";
      case FeatureItem.myCarLog:
        return "My Car Log";
      case FeatureItem.softwareUpdate:
        return "Software update";
      case FeatureItem.geofence:
        return "Geofence";
      case FeatureItem.findMyCar:
        return "Find My Car";
      case FeatureItem.remoteConfirmation:
        return "Remote Confirmation";
    }
  }
}
