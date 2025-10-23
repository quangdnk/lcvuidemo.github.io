import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/home/control/home_control_view.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_view.dart';
import 'package:lcv_ui_demo/view/home/home_car_view.dart';
import 'package:lcv_ui_demo/view/home/home_header_main_view.dart';
import 'package:lcv_ui_demo/view/home/information/home_infomation_view.dart';
import 'package:lcv_ui_demo/view/home/information/items/home_information_remote.dart';

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
            HomeFeatureView(),
          ],
        ),
      ),
    );
  }
}
