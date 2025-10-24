import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/widgets/picker/picker_header_view.dart';

class TimepickerView extends StatefulWidget {
  const TimepickerView(this.selectedTime, {super.key});

  final DateTime? selectedTime;

  @override
  State<TimepickerView> createState() => _TimepickerViewState();
}

class _TimepickerViewState extends State<TimepickerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black30,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            PickerHeaderView(
              title: "Select date",
              save: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 220,
              width: 200,
              child: Align(
                alignment: Alignment.center,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    backgroundColor: Colors.black.withValues(alpha: 0.1),
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    onDateTimeChanged: (data) {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
