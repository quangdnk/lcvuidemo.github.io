import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';

class HomeControlAlertView extends StatefulWidget {
  const HomeControlAlertView({super.key});

  @override
  State<HomeControlAlertView> createState() => _HomeControlAlertViewState();
}

class _HomeControlAlertViewState extends State<HomeControlAlertView> {
  @override
  Widget build(BuildContext context) {
    return const Row(children: []);
  }
}

enum WarningType { red, yellow }

extension WarningTypeExtension on WarningType {
  Color get backgroundColor {
    switch (this) {
      case WarningType.red:
        return "#F12C34".toColor();
      case WarningType.yellow:
        return "#CC9600".toColor();
    }
  }
}
