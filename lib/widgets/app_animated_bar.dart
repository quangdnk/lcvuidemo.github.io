import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';

class AppAnimatedBar extends StatefulWidget {
  const AppAnimatedBar({super.key, required this.progress});
  final double progress;

  @override
  State<AppAnimatedBar> createState() => _AppAnimatedBarState();
}

class _AppAnimatedBarState extends State<AppAnimatedBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.progress / 100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant AppAnimatedBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.progress / 100,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.black35),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _animation.value.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(color: AppColors.grayC8),
            ),
          );
        },
      ),
    );
  }
}
