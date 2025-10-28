import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/claimatecontrol/claimate_control_detail.dart';
import 'package:lcv_ui_demo/view/claimatecontrol/claimate_control_screen.dart';
import 'package:lcv_ui_demo/view/home/control/home_control_view.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_item.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_view.dart';
import 'package:lcv_ui_demo/view/home/home_car_view.dart';
import 'package:lcv_ui_demo/view/home/home_header_main_view.dart';
import 'package:lcv_ui_demo/view/home/information/home_infomation_view.dart';
import 'package:lcv_ui_demo/view/home/information/items/home_information_remote.dart';
import 'package:lcv_ui_demo/widgets/picker/date_picker_view.dart';
import 'package:lcv_ui_demo/widgets/picker/repeat_picker_view.dart';
import 'package:lcv_ui_demo/widgets/picker/time_picker_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InfoRemoteStatus infoRemoteStatus = InfoRemoteStatus.good;
  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeaderMainView(),
            HomeCarView(),
            HomeControlView(),
            HomeInfomationView(infoRemoteStatus: infoRemoteStatus),
            HomeFeatureView(
              itemClicked: (FeatureItem value) {
                switch (value) {
                  case FeatureItem.vehicleDiagnostic:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case FeatureItem.climateControl:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClaimateControlScreen(),
                      ),
                    );
                  // showModalBottomSheet(
                  //   context: context,
                  //   // isScrollControlled: true,
                  //   builder: (context) {
                  //     return SizedBox(height: 470, child: RepeatpickerView());
                  //   },
                  // );
                  case FeatureItem.serviceInfomation:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case FeatureItem.driveDiagnostic:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case FeatureItem.myCarLog:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case FeatureItem.softwareUpdate:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case FeatureItem.geofence:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case FeatureItem.findMyCar:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case FeatureItem.remoteConfirmation:
                    // TODO: Handle this case.
                    throw UnimplementedError();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
