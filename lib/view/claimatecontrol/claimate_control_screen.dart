import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/domains/enities/reservation.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/repositories/reservation_repository.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/themes/app_decorations.dart';
import 'package:lcv_ui_demo/view/claimatecontrol/claimate_control_detail.dart';
import 'package:lcv_ui_demo/widgets/app_text.dart';
import 'package:lcv_ui_demo/widgets/header/home_header_view.dart';

class ClaimateControlScreen extends StatefulWidget {
  const ClaimateControlScreen({super.key});

  @override
  State<ClaimateControlScreen> createState() => _ClaimateControlScreenState();
}

class _ClaimateControlScreenState extends State<ClaimateControlScreen> {
  late final ReservationRepository repository;

  late List<Reservation> items = [];
  @override
  void initState() {
    super.initState();
    repository = ReservationRepository();
    callData();
  }

  void callData() {
    repository.getResevation().then((result) {
      setState(() {
        items = result.data ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: HomeHeaderView(title: "Claimate Control"),
          ),
          _line(),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _status(),
                    SizedBox(height: 15),
                    _setting(),
                    SizedBox(height: 15),
                    _schedule(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _status() {
    return Container(
      height: 72,
      decoration: AppDecorations.boxWithBorder,
      child: _header(
        Assets.icons.home.icHomeFeatureClimatecontrol.image(),
        "Claimate Status",
        Text("OFF"),
      ),
    );
  }

  Widget _setting() {
    return Container(
      height: 310,
      decoration: AppDecorations.boxWithBorder,
      child: Column(
        children: [
          _header(
            Assets.icons.commons.icSetting.image(),
            "Setting",
            Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Assets.icons.commons.icUpdate.image(),
                ),
                SizedBox(width: 5),
                AppText("Update"),
              ],
            ),
          ),
          SizedBox(height: 50),
          _settingItem("Duration", AppText("10 mins")),
          _line(),
          _settingItem("Auto mode", AppText("On")),
          _line(),
          _settingItem(
            "Defros",
            Row(
              children: [
                _settingDefrostItem(
                  Assets.icons.commons.icFront.image(),
                  "Front",
                ),
                SizedBox(width: 5),
                _settingDefrostItem(
                  Assets.icons.commons.icRear.image(),
                  "Rear",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _schedule() {
    return Container(
      height: 310,
      decoration: AppDecorations.boxWithBorder,
      child: Column(
        children: [
          _header(
            Assets.icons.commons.icCalendar.image(),
            "Schedule",
            GestureDetector(
              child: AppText("+ Add new"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClaimateControlDetail(),
                  ),
                );
              },
            ),
          ),
          ...items.map(
            (e) => _scheduleItem(e, (Reservation item) {
              item.activeStatus = !(item.activeStatus);
              repository.editReservation(item.parse()).then((_) => callData());
            }),
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

  Widget _header(Image img, String title, Widget main) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 40, height: 40, child: img),
            SizedBox(height: 5),
            AppText(title),
          ],
        ),
        main,
      ],
    );
  }

  Widget _settingItem(String title, Widget main) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [AppText(title), main],
      ),
    );
  }

  Widget _settingDefrostItem(Image img, String title) {
    return Row(
      children: [
        SizedBox(width: 20, height: 20, child: img),
        SizedBox(width: 2),
        AppText(title),
      ],
    );
  }

  Widget _scheduleItem(Reservation item, ValueChanged<Reservation> onChange) {
    return SizedBox(
      height: 62,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AppText(item.title()), AppText(item.desc())],
          ),
          Switch(
            value: item.activeStatus,
            onChanged: (c) {
              onChange(item);
            },
          ),
        ],
      ),
    );
  }
}
