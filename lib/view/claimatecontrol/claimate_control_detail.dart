import 'package:flutter/material.dart';

import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/themes/app_decorations.dart';
import 'package:lcv_ui_demo/widgets/app_text.dart';
import 'package:lcv_ui_demo/widgets/header/home_header_view.dart';
import 'package:lcv_ui_demo/widgets/picker/date_picker_view.dart';
import 'package:lcv_ui_demo/widgets/picker/repeat_picker_view.dart';
import 'package:lcv_ui_demo/widgets/picker/time_picker_view.dart';

class ClaimateControlDetail extends StatefulWidget {
  const ClaimateControlDetail({super.key});

  @override
  State<ClaimateControlDetail> createState() => _ClaimateControlDetailState();
}

class _ClaimateControlDetailState extends State<ClaimateControlDetail> {
  bool is10min = true;
  bool isAuto = true;
  bool isFront = true;
  bool isRear = true;
  bool isSpeciflic = true;
  bool isRepeat = false;
  List<Repeat> repeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: HomeHeaderView(title: "New Schedule"),
          ),
          _line(),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _settingView(),
                    SizedBox(height: 16),
                    _scheduleView(),
                  ],
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(20), child: _saveButton()),
        ],
      ),
    );
  }

  Widget _settingView() {
    return Container(
      decoration: AppDecorations.boxWithBorder,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _headerView("Setting", Assets.icons.commons.icSetting.image()),
            _duration(),
            _line(),
            _autoMode(),
            _line(),
            _defrost(),
          ],
        ),
      ),
    );
  }

  Widget _temperature() {
    return Column(children: [AppText("24.5°C", fontSize: 24)]);
  }

  Widget _scheduleView() {
    return Container(
      decoration: AppDecorations.boxWithBorder,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _headerView("Schedule", Assets.icons.commons.icCalendar.image()),
            _scheduleTime(),
            _line(),
            SizedBox(height: 12),
            _scheduleType(),
          ],
        ),
      ),
    );
  }

  Widget _scheduleTime() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SizedBox(height: 350, child: TimepickerView(DateTime.now()));
          },
        );
      },
      child: SizedBox(
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText("Time"),
            Row(children: [AppText("08:00"), SizedBox(width: 4)]),
          ],
        ),
      ),
    );
  }

  Widget _scheduleType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText("Schedule type"),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SizedBox(height: 480, child: DatepickerView());
              },
            );
          },
          child: SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _radioButton(true, "Specific date", () {}),
                AppText("10/10/2025 >"),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SizedBox(height: 380, child: RepeatpickerView());
              },
            );
          },
          child: SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _radioButton(false, "Repeat", () {}),
                AppText("Never"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _saveButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text("Save"),
      ),
    );
  }

  Widget _headerView(String title, Image img) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.black3C,
                borderRadius: BorderRadius.circular(2),
              ),
              child: img,
            ),
            SizedBox(width: 10),
            AppText(title, fontSize: 16),
          ],
        ),
        SizedBox(height: 12),
        _line(),
      ],
    );
  }

  Widget _radioButton(bool isSelected, String title, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child:
                (isSelected
                        ? Assets.icons.commons.icRadiobuttonChecked
                        : Assets.icons.commons.icRadiobuttonUncheck)
                    .image(),
          ),
          SizedBox(width: 8),
          AppText(title),
        ],
      ),
    );
  }

  Widget _checkBoxButton(bool isSelected, String title, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child:
                (isSelected
                        ? Assets.icons.commons.icCheckboxChecked
                        : Assets.icons.commons.icCheckboxUncheck)
                    .image(),
          ),
          SizedBox(width: 8),
          AppText(title),
        ],
      ),
    );
  }

  Widget _duration() {
    return SizedBox(
      height: 83,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText("Duration", fontSize: 14),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: _radioButton(is10min, "10 mins", () {
                  setState(() {
                    is10min = true;
                  });
                }),
              ),
              Expanded(
                flex: 1,
                child: _radioButton(!is10min, "20 mins", () {
                  setState(() {
                    is10min = false;
                  });
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _autoMode() {
    return SizedBox(
      height: 83,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText("Auto Mode", fontSize: 14),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: _radioButton(isAuto, "ON", () {
                  setState(() {
                    isAuto = true;
                  });
                }),
              ),
              Expanded(
                flex: 1,
                child: _radioButton(!isAuto, "OFF", () {
                  setState(() {
                    isAuto = false;
                  });
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _defrost() {
    return SizedBox(
      height: 83,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText("Defrost", fontSize: 14),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: _checkBoxButton(isFront, "Front", () {
                  setState(() {
                    isFront = !isFront;
                  });
                }),
              ),
              Flexible(
                flex: 1,
                child: _checkBoxButton(isRear, "Rear", () {
                  setState(() {
                    isRear = !isRear;
                  });
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _line() {
    return Container(
      height: 1,
      decoration: BoxDecoration(color: AppColors.black3C),
    );
  }
}
