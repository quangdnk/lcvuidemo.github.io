import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/view/home/feature/home_feature_item.dart';

class HomeFeatureItems extends StatelessWidget {
  const HomeFeatureItems({
    super.key,
    required this.features,
    required this.isShow,
  });
  final List<FeatureItem> features;

  final bool isShow;

  @override
  Widget build(BuildContext context) {
    return _config();
  }

  Widget _config() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      children:
          features.map((feature) {
            return HomeFeatureItem(item: feature);
          }).toList(),
    );
  }
}
