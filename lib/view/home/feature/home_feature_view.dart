import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/themes/app_gradients.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_customize_view.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_header_view.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_item.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_items.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';

class HomeFeatureView extends StatefulWidget {
  const HomeFeatureView({super.key});

  @override
  State<HomeFeatureView> createState() => _HomeFeatureViewState();
}

class _HomeFeatureViewState extends State<HomeFeatureView> {
  final List<FeatureItem> features = FeatureItem.values;

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return Column(children: [_featureContent(), HomeFeatureCustomizeView()]);
  }

  Widget _featureContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: "#3A3B3C".toColor()),
          gradient: AppGradients.featueBackground,
        ),
        child: Column(
          children: [
            HomeFeatureHeaderView(
              featureTap: () {
                setState(() {
                  isShow = !isShow;
                });
              },
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child:
                  isShow
                      ? HomeFeatureItems(features: features, isShow: isShow)
                      : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
