import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/home/information/items/home_information_findcar.dart';
import 'package:lcv_ui_demo/view/home/information/items/home_information_fuel.dart';
import 'package:lcv_ui_demo/view/home/information/items/home_information_geofence.dart';
import 'package:lcv_ui_demo/view/home/information/items/home_information_remote.dart';

class HomeInfomationView extends StatelessWidget {
  const HomeInfomationView({super.key, required this.infoRemoteStatus});
  final InfoRemoteStatus infoRemoteStatus;
  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1,
      children: [
        HomeInformationFuel(),
        HomeInformationFindcar(),
        HomeInformationGeofence(),
        HomeInformationRemote(status: infoRemoteStatus),
      ],
    );
  }
}
