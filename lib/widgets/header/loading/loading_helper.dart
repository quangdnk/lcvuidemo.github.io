import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingHelper {
  static bool _isShowing = false;

  static void showLoading(BuildContext context, {String? message}) {
    if (_isShowing) return;

    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SpinKitFadingCircle(color: Colors.blue, size: 50.0),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(message, style: const TextStyle(color: Colors.white)),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (_isShowing) {
      Navigator.of(context, rootNavigator: true).pop();
      _isShowing = false;
    }
  }
}
