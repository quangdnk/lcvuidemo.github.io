import 'package:LCVFlutterSDK/core/config/sdk_config.dart';
import 'package:LCVFlutterSDK/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/home/home_screen.dart';

void main() {
  ServiceLocator.setup(
    sdkConfig: SdkConfig(env: Environment.stg, timeout: Duration(minutes: 2)),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Center(child: HomeScreen())));
  }
}
