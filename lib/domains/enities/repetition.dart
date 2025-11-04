import 'package:lcv_ui_demo/domains/enities/reservation_setting.dart';

class Repetition {
  final List<int> week;
  final int hours;
  final int mins;
  final ReservationSetting setting;

  Repetition({
    required this.week,
    required this.hours,
    required this.mins,
    required this.setting,
  });

  factory Repetition.fromJson(Map<String, dynamic> json) {
    return Repetition(
      week: List<int>.from(json["Week"] ?? []),
      hours: json["Hours"],
      mins: json["Minutes"],
      setting: ReservationSetting.fromJson(json["AcSettings"]),
    );
  }
}
