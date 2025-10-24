import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({super.key, required this.value, required this.newValue});
  final double value;
  final ValueChanged<double> newValue;
  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  late double newvalue;

  @override
  void initState() {
    super.initState();
    newvalue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 18,
      max: 28,
      divisions: ((28 - 18) / 0.5).round(),
      value: newvalue,
      onChanged: (change) {
        setState(() {
          newvalue = change;
        });
        widget.newValue(change);
      },
    );
  }
}
